local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'ga', '<cmd>Lspsaga code_action<cr>', opts) -- eg. autoimport
vim.api.nvim_set_keymap('v', 'ga', ':<c-u>Lspsaga range_code_action<cr>', opts) -- eg. autoimport
vim.api.nvim_set_keymap('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Lspsaga rename<cr>', opts)
vim.api.nvim_set_keymap('n', 'gn', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.api.nvim_set_keymap('n', 'gN', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
