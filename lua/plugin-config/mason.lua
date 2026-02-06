require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { 'clangd', 'pylsp', 'lua_ls', 'cmake' },
    automatic_installation = true,
})
