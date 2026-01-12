return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = { "c", "cpp", "lua", "vim", "javascript", "html", "python", "regex", "bash", },
  },
}
