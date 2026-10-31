-- Safe guard: Try to load treesitter, stop if not found
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

require("nvim-treesitter.install").prefer_git = true

local parsers = { "bash", "c", "cpp", "json", "lua", "python" }
local cli_version = vim.fn.executable("tree-sitter") == 1
    and vim.fn.system("tree-sitter --version") or ""
local cli_minor = tonumber(cli_version:match("tree%-sitter 0%.(%d+)"))
if cli_minor == 25 then
    table.insert(parsers, "swift")
end

configs.setup {
    ensure_installed = parsers,
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
