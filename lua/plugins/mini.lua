return {
  {
    'echasnovski/mini.icons',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  {
    'echasnovski/mini.pairs',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  {
    'echasnovski/mini.ai',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  {
    'echasnovski/mini.comment',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  {
    'echasnovski/mini.files',
    event = { "BufReadPre", "BufNewFile" },
    version = false,
    opts = {},
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open()
        end,
        desc = "Open Mini Files(File Manager)",
      },
    }
  },
  {
    'echasnovski/mini.jump2d',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  {
    'echasnovski/mini.indentscope',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  {
    'echasnovski/mini.hipatterns',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end
  },
  {
    'echasnovski/mini.surround',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  {
    'echasnovski/mini.animate',
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
