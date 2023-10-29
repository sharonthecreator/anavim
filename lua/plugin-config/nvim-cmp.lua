local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')

local servers = { 'jedi_language_server', 'sumneko_lua', 'bashls' , 'jsonls', 'cmake' }
for _, lsp_server in pairs(servers) do
  lsp[lsp_server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {debounce_text_changes = 150}
  }
end

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
    flags = {debounce_text_changes = 150}
}

-- lsp["pylsp"].setup {
--     capabilities = capabilities,
--     settings = {
--         pylsp = {
--             plugins = {
--                 flake8 = {
--                     config = ".flake8",
--                 },
--             },
--         },
--     },
--     on_attach = on_attach,
--     flags = {debounce_text_changes = 150}
-- }
