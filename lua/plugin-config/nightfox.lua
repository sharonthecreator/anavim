require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

-- setup must be called before loading
vim.cmd("colorscheme carbonfox")

