return {
  { 'echasnovski/mini.icons',   version = false, opts = {} },
  { 'echasnovski/mini.pairs',   version = false, opts = {} },
  { 'echasnovski/mini.ai',      version = false, opts = {} },
  { 'echasnovski/mini.comment', version = false, opts = {} },
  {
    'echasnovski/mini.files',
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
  { 'echasnovski/mini.jump2d',      version = false, opts = {} },
  { 'echasnovski/mini.indentscope', version = false, opts = {} },
  {
    'echasnovski/mini.hipatterns',
    version = false,
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
  { 'echasnovski/mini.surround', version = false, opts = {} },
}
