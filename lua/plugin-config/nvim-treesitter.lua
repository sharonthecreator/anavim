-- Safe guard: Try to load treesitter, stop if not found
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

require("nvim-treesitter.install").prefer_git = true

configs.setup {
    ensure_installed = { "bash", "c", "cpp", "json", "lua", "python" },
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "latex" },
    },
    -- Note: 'autopairs' inside treesitter usually requires the nvim-autopairs plugin
    autopairs = {
        enable = true,
    },
}
