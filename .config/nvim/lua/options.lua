vim.g.netrw_banner = false

local opt = vim.opt

opt.termguicolors = true

opt.number = true
-- opt.numberwidth = 2
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

opt.completeopt = "menuone,noselect,fuzzy,nosort"
opt.shortmess:append("c")

-- A tester, oopen a substitution preview window
opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true

opt.laststatus = 3

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- to check
vim.opt.isfname:append("@-@")

-- let the terminal choose the cursor
opt.guicursor = ""

opt.scrolloff = 10

opt.signcolumn = "yes"

-- hide the command line by default
-- opt.cmdheight = 0

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when anking text",
    callback = function()
        vim.hl.on_yank()
    end,
})
