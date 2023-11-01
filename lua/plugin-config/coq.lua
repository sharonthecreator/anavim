vim.g.coq_settings = {
    ["keymap.pre_select"] = true,
}

local lsp = require "lspconfig"
local coq = require "coq"

lsp.tsserver.setup{}
lsp.tsserver.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')
