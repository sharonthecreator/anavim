vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        mode = "tabs",
        separator_style = "slant",
        truncate_names = false,
        diagnostics = "nvim_lsp",
        buffer_close_icon = "",
        offsets = {
            {
                filetype = "NvimTree",
                text = function()
                    return "Project - " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                end,
                highlight = "Bold",
                text_align = "left",
                separator = true
            }
        }
}}
