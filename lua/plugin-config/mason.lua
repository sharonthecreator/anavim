require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason_lspconfig.setup {
    ensure_installed = {'bashls', 'lua_ls', 'pylsp', 'jsonls', 'clangd', 'cmake', 'rust_analyzer', 'texlab' },
    automatic_installation = true,
}

mason_lspconfig.setup_handlers {
  -- This is a default haudler that will be called for each installed server (also for new servers that are installed during a session)
  function (server_name)
    if server_name == "pylsp" then
      lspconfig["pylsp"].setup({
        on_attach = on_attach,
        settings = {
          pycodestyle = {
            enabled = true,
            ignore = {'E501', 'E231'},
            maxLineLength = 120
          },
        }
      })
    else
      lspconfig[server_name].setup({
        on_attach = on_attach,
      })
    end
  end,
}
