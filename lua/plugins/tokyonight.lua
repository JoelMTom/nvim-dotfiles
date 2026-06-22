local opts = {
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  }
}

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = function(_, _)
    vim.schedule(function()
      vim.cmd([[ colorscheme tokyonight-night ]])
    end)
    return opts
  end,
}
