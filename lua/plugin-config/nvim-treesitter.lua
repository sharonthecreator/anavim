require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup {
  ensure_installed = { "bash", "c", "cpp", "json", "lua", "python" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "latex" },
  },
  autopairs = {
    enable = true,
  },
}
