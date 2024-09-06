require "nvchad.options"

local options = {
  expandtab = true, -- convert tabs to spaces
  backup = false,
  smartindent = true, -- make indenting smarter again
  tabstop = 2, -- insert 2 spaces for a tab
  shiftwidth = 2,
  termguicolors = true, -- set term gui colors (most terminals support this)
  updatetime = 250, -- faster completion (4000ms default)
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  -- shortmess = vim.opt.shortmess + "c",
  -- completeopt = { "menu", "menuone", "noselect" },
  completeopt = { "menuone", "noselect" },
  timeoutlen = 250, -- don't wait to open Which key popup
  title = false,
  mouse = "",
  number = true,
  relativenumber = true,
  ruler = true,
  showmatch = true, -- Highlight matching brackets
  so = 10, -- Set 10 lines to the cursor when moving vertically
  splitbelow = true, -- Split below by default
  splitright = true, -- Split on the right side by default
  hlsearch = true, -- Set highlight on search
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  cursorline = true,
  breakindent = true,
  undofile = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
