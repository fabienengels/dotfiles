-- https://dotfiles.substack.com/p/whats-new-in-neovim-012
-- https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack.html
-- https://tduyng.com/blog/neovim-basic-setup/
-- https://github.com/Sin-cy/nvim-scratch/

-- TODO : https://github.com/catgoose/nvim-colorizer.lua ?
-- TODO : https://github.com/folke/flash.nvim ?

require("vim._core.ui2").enable()

require "options"
require "pack"
require "mini"
require "lsp"
require "keymaps"
