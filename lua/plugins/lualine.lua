-- local colors = {
--   yellow = "#ECBE7B",
--   cyan = "#008080",
--   darkblue = "#081633",
--   green = "#98be65",
--   orange = "#FF8800",
--   violet = "#a9a1e1",
--   magenta = "#c678dd",
--   blue = "#51afef",
--   red = "#ec5f67"
-- }

local lualine_config = {
  options = {
    icons_enabled = true,
    theme = "dracula",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = { "encoding", "fileformat", "filetype" },
    lualine_z = { "progress", "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


-- Inserts a component in lualine_c at left section
-- local function ins_left(config, component)
--   table.insert(config.sections.lualine_c, component)
-- end

-- Inserts a component in lualine_x ot right section
local function ins_right(config, component)
  -- print("Hello")
  table.insert(config.sections.lualine_x, component)
end

local lsp_progress_config = {
  "lsp_progress",
  --display_components = { "lsp_client_name", { "title", "percentage", "message" } },
  -- With spinner
  -- display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" }},
  -- colors = {
  --   percentage      = colors.cyan,
  --   title           = colors.cyan,
  --   message         = colors.cyan,
  --   spinner         = colors.cyan,
  --   lsp_client_name = colors.magenta,
  --   use             = true,
  -- },
  separators = {
    component = " ",
    progress = " | ",
    -- message = { pre = "(", post = ")" },
    percentage = { pre = "", post = "%% " },
    title = { pre = "", post = ": " },
    lsp_client_name = { pre = "[", post = "]" },
    spinner = { pre = "", post = "" },
    message = {
      pre = "(",
      post = ")",
      commenced = "In Progress",
      completed = "Completed"
    },
  },
  display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
  timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
  spinner_symbols = { "", "", "", "", "", "", "", "", "", "", "", "" },
}

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "arkav/lualine-lsp-progress" },
  init = function()
    ins_right(lualine_config, lsp_progress_config)
  end,
  opts = lualine_config,
  -- config = function(_, opts)
  --   ins_right(opts, lsp_progress_config)
  --   -- print(vim.inspect(opts))
  --   require("lualine").setup(opts)
  -- end,

}
