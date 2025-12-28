require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391', 'E501'},
          maxLineLength = 100
        }
      }
    }
  }
}


mason_lspconfig.setup {
    ensure_installed = {'bashls', 'lua_ls', 'pylsp', 'jsonls', 'clangd', 'cmake', 'rust_analyzer', 'texlab', 'ts_ls' },
    automatic_installation = true,
}

mason_lspconfig.setup_handlers {
  -- This is a default haudler that will be called for each installed server (also for new servers that are installed during a session)
  function (server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
    })
  end,
}
