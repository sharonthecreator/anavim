local codewindow = require('codewindow')
codewindow.setup({
    auto_enable = true,
})
codewindow.apply_default_keybinds()

vim.api.nvim_set_hl(0, 'CodewindowBorder', {fg = '#C586C0'})
