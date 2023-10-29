local opts = {silent = true, noremap = true}
vim.api.nvim_set_keymap('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>r', '<Cmd>NvimTreeRefresh<CR>', opts)
-- find the currently open file in tree
vim.api.nvim_set_keymap('n', '<leader>n', '<Cmd>NvimTreeFindFile<CR>', opts)

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = "<C-t>", cb = tree_cb("tabnew") },
  { key = "<CR>", cb = tree_cb("edit") },
  { key = "o", cb = tree_cb("edit") },
  { key = "<2-LeftMouse>", cb = tree_cb("edit") },
  { key = ">", cb = tree_cb("cd") },
  { key = "<", cb = tree_cb("dir_up") },
  { key = "<Tab>", cb = tree_cb("preview") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "a", cb = tree_cb("create") },
  { key = "d", cb = tree_cb("remove") },
  { key = "r", cb = tree_cb("rename") },
  { key = "x", cb = tree_cb("cut") },
  { key = "y", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "q", cb = tree_cb("close") }
}


require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_focused_file = {
    enable = true,
    update_root = false
  },
  tab = {
    sync = {
      open = true,
      close = true
    }
  },
  view = {
    preserve_window_proportions = true,
    adaptive_size = false,
    width = 30,
    side = 'left'
  },
  filesystem_watchers = {
    enable = true
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true,
    }
  },
  renderer = {
    root_folder_label = false
  }
}
