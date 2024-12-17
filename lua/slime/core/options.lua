local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")


if vim.g.neovide then
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.opt.guifont = { "MesloLGS NF", "h12" }
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_refresh_rate = 30
  vim.g.neovide_cursor_animation_length = 0.1 -- 0.1
  vim.g.neovide_cursor_vfx_mode = "torpedo"
  vim.g.neovide_cursor_vfx_particle_density = 10.0
  -- Put anything you want to happen only in Neovide here
end
