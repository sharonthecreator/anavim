require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {'bashls', 'lua_ls', 'jedi_language_server', 'jsonls', 'clangd', 'cmake', "rust_analyzer" },
    automatic_installation = true,
}

-- install LSP servers
local function installServer(name)
    local ok, server = lsp_installer_servers.get_server(name)
    if ok then
        if not server:is_installed() then
            server:install()
        end
    end
end

local function installServers(names)
    for _,name in pairs(names) do
        installServer(name)
    end
end

-- diagnostic symbols
local signs = { Error = "", Warn = "", Hint = "", Info =  ""}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- completion symbols
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}
