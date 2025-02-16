return {
  { 'echasnovski/mini.icons', version = false, opts = {} },
  { 'echasnovski/mini.pairs', version = false, opts = {} },
  { 'echasnovski/mini.ai', version = false, opts = {} },
  { 'echasnovski/mini.comment', version = false, opts = {} },
  { 'echasnovski/mini.files',
    lazy = false,
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
}
