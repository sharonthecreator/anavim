vim.g.coq_settings = {
    ["keymap.pre_select"] = true,
    ["completion.skip_after"] = {"{", "}", "[", "]"},
    ["display.ghost_text.enabled"] = false,
    ["clients.tmux.enabled"] = false,
}

local coq = require("coq")

local clangd_opts = coq.lsp_ensure_capabilities({})
vim.lsp.config('clangd', clangd_opts)
vim.lsp.enable('clangd')

vim.cmd('COQnow -s')
