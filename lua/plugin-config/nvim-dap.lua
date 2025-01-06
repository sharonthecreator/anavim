local dap = require('dap')
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup()

dap.adapters.gdb = {
    type = 'executable',
    command = '/usr/bin/gdb', -- Path to your gdb executable
    name = 'gdb'
}

dap.adapters.lldb = {
    type = 'executable',
    command = '/opt/homebrew/opt/llvm/bin/lldb-dap', -- Path to your lldb executable
    name = 'lldb'
}

dap.configurations.c = {
    {
        name = "Debug STM32 with J-Link",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}/src',
        stopOnEntry = false,
        args = {}, -- Add program arguments here if needed
        -- miDebuggerServerAddress = 'localhost:2331', -- Default port for JLinkGDBServer
        -- miDebuggerPath = '/usr/bin/gdb', -- Path to gdb
        -- setupCommands = {
        --     {
        --         text = '-enable-pretty-printing',
        --         description = 'Enable pretty printing',
        --         ignoreFailures = true
        --     },
        -- },
    },
}

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

local opts = { noremap = true, silent = true }

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

vim.api.nvim_set_keymap('n', '<Leader>rr', "<Cmd>DapContinue<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>c', "<Cmd>DapContinue<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>rt', "<Cmd>DapTerminate<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>l', ":lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>j', ":lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>k', ":lua require'dap'.step_out()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>dr', ":lua require'dap'.repl.open()<CR>", opts)
