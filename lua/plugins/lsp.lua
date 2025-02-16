return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind.nvim",
    },

    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = cmp.mapping.confirm({ select = true, }),
          ["<C-f>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-b>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },

        formatting = {
          fields = {
            "abbr",
            "kind",
            "menu",
          },

          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = {
              menu = 50,
              abbr = 50,
            },
            ellipsis_char = "...",
            show_labelDetails = true,

            before = function(_, vim_item)
              return vim_item
            end
          }),

          expandable_indicator = true,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

      })
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
          },
        },
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
    },
    init = function()
      vim.opt.signcolumn = "yes"
    end,
    config = function()
      local lsp_defaults = require('lspconfig').util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP Actions",
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = opts.buffer, desc = "Preview "})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = opts.buffer, desc = "Goto Definition(LSP)" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = opts.buffer, desc = "Goto Declaration(LSP)" })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = opts.buffer, desc = "Goto Implementation(LSP)" })
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = opts.buffer, desc = "Goto Type Definition(LSP)" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = opts.buffer, desc = "Goto References(LSP)" })
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = opts.buffer, desc = "Signature Help(LSP)" })
          vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = opts.buffer, desc = "Rename variable under cursor(LSP)" })
          vim.keymap.set({ "n", "x" }, "<F3>", vim.lsp.buf.format, { buffer = opts.buffer, desc = "Format file(LSP)" })
          vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { buffer = opts.buffer, desc = "Code Actions(LSP)" })
        end,
      })

      -- For border on floating window (globally)
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        ---@diagnostic disable-next-line: inject-field
        opts.border = "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls", },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end
        },
        automatic_installation = true,
      })
    end,
  },

}
