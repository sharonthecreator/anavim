vim.g.coq_settings = {
    ["keymap.pre_select"] = true,
    ["completion.skip_after"] = {"{", "}", "[", "]"},
}

local lsp = require "lspconfig"
local coq = require "coq"

lsp.ts_ls.setup{}
lsp.ts_ls.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')
