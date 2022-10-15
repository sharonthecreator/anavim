require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

-- lspconfig.sumneko_lua.setup {}
lspconfig.bashls.setup {}
lspconfig.pyright.setup {}
lspconfig.jsonls.setup {}
lspconfig.clangd.setup {}
lspconfig.cmake.setup {}
