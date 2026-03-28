local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    }),
})

cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{ name = 'buffer' }}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {{ name = 'path' }},
        {{ name = 'cmdline' }}
    )
})

-- LSP setup with nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')

local servers = { 'pylsp', 'lua_ls', 'bashls', 'jsonls', 'cmake', 'texlab', 'ts_ls' }
for _, lsp_server in pairs(servers) do
    lsp[lsp_server].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = { debounce_text_changes = 150 },
    }
end

lsp["sourcekit"].setup {
    capabilities = capabilities,
    cmd = { "xcrun", "sourcekit-lsp" },
    root_dir = function(fname)
        return lsp.util.root_pattern("Package.swift", "buildServer.json", ".git")(fname)
            or vim.fn.fnamemodify(fname, ':h')
    end,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
}

lsp["clangd"].setup {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--completion-style=bundled",
        "--header-insertion=iwyu",
        "--limit-results=10",
        "--pch-storage=memory",
    },
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
}
