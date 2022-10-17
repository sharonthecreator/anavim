require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "c", "cpp", "cmake", "json", "lua", "make", "python" },
  highlight = {
    enable = true
  }
}
