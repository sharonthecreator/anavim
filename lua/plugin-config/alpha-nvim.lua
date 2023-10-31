local alpha = require("alpha")
require"alpha.term"
local dashboard = require("alpha.themes.dashboard")
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButton"
  b.opts.hl_shortcut = "AlphaButton"
  return b
end

local function get_ascii_image_dim(path)
    local width = 0
    local height = 0

    local pfile = io.open(path, "r")

    for line in pfile:lines() do
        local current_width = vim.fn.strdisplaywidth(line)
        if current_width > width then
            width = current_width
        end
        height = height + 1
    end
    -- Increacing the height by 1,
    -- else it causes the animation to slide off the screen.
    return { width, height + 1}
end

LOGO_DIR = os.getenv("HOME") .. "/.config/nvim/logo"
local logo_image = LOGO_DIR .. "/anavim_logo.cat"
local image_width, image_height = unpack(get_ascii_image_dim(logo_image))
local command = LOGO_DIR .. "/animate_ascii.sh "

local terminal = {
    type = "terminal",
    command = command .. logo_image,
    width = image_width,
    height = image_height,
    opts = {
        redraw = true,
        window_config = {},
    },
}

dashboard.section.buttons.val = {
  button("Ctrl + n", "  Open File Explorer", ":NvimTreeToggle<cr>"),
  button("Ctrl + p", "  Find File", ":Telescope find_files <cr>"),
  button("Ctrl + f", "  Find String", ":Telescope live_grep<cr>"),
  button("q", "  Quit", ":qa<cr>")
}

local function footer()
  local total_plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start*", "*", 0, 1))
  return "Loaded " .. total_plugins .. " plugins  "
end

local heading = {
  type = "text",
  val = "< Unlock your developer potential >",
  opts = {
    position = "center",
    hl = "AlphaComment",
  },
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "AlphaFooter"

local opts = {
  layout = {
    { type = "padding", val = 3 },
    terminal,
    { type = "padding", val = image_height - 18 },
    heading,
    { type = "padding", val = 1 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
  },
  opts = {
    margin = 5
  },
}
alpha.setup(opts)
vim.cmd([[ autocmd FileType alpha setlocal nofoldenable]])
vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  command = "set showtabline=0 laststatus=0 noruler",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  callback = function()
    vim.api.nvim_create_autocmd("BufUnload", {
      group = "alpha_tabline",
      buffer = 0,
      command = "set showtabline=2 ruler laststatus=3",
    })
  end,
})
