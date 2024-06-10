-- vim: ts=2 sts=2 sw=2 et

--              _   _
--   ___  _ __ | |_(_) ___  _ __  ___
--  / _ \| '_ \| __| |/ _ \| '_ \/ __|
-- | (_) | |_) | |_| | (_) | | | \__ \
--  \___/| .__/ \__|_|\___/|_| |_|___/
--       |_|

local options = {
  expandtab = true, -- convert tabs to spaces
  backup = false,
  smartindent = true, -- make indenting smarter again
  tabstop = 2, -- insert 2 spaces for a tab
  shiftwidth = 2,
  termguicolors = true, -- set term gui colors (most terminals support this)
  updatetime = 250, -- faster completion (4000ms default)
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  shortmess = vim.opt.shortmess + "c",
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

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

--  _
-- | | __ _ _____   _
-- | |/ _` |_  / | | |
-- | | (_| |/ /| |_| |
-- |_|\__,_/___|\__, |
--              |___/

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd.colorscheme "catppuccin"

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end



vim.diagnostic.config({
  float = {
    border = "rounded",
  },
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  close_events = { "BufHidden", "InsertLeave" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.diagnostic.config({virtual_text = true})
