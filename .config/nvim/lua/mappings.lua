require "nvchad.mappings"

--

local map = vim.keymap.set

-- Indent with Tab
map("n", "<Tab>", ">>", { noremap = true, silent = true })
map("n", "<S-Tab>", "<<", { noremap = true, silent = true })
map("v", "<Tab>", ">><Esc>gv", { noremap = true, silent = true })
map("v", "<S-Tab>", "<<<Esc>gv", { noremap = true, silent = true })

-- Stop search highlight
map("n", "<ESC>", ":noh<return><ESC>", { noremap = true, silent = true })

-- Theme picker
-- map("n", "<leader>tp", "<cmd>lua require('nvchad.themes').open()<cr>", { noremap = true, silent = true })


-- https://github.com/fabienengels/dotfiles/blob/47cec2c1cff853fac0c3f20c954243b124effa6f/.config/nvim/lua/plugins/shortcuts.lua
--   {
--     "folke/which-key.nvim",
--     config = function ()
--       require("which-key").register({
--         ["w"] = { "<cmd>w!<cr>", "Save" },
--         ["q"] = { "<cmd>q!<cr>", "Quit" },
--         ["c"] = { "<cmd>BufferKill<cr>", "Close Buffer" },
--         b = {
--           name = "Buffers",
--           f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
--         },
--         f = {
--           name = "Files",
--           g = { "<cmd>Telescope git_files<cr>", "Find git file" }, -- create a binding with label
--           f = { "<cmd>Telescope find_files<cr>", "Find file" }, -- create a binding with label
--           r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
--           n = { "New File" }, -- just a label. don't create any mapping
--           e = "Edit File", -- same as above
--         },
--         g = {
--           name = "Git",
--           j = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
--           k = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
--           p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
--           r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
--           R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
--           s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
--           u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk" },
--           o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--           b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--           c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--           d = { "<cmd>Gitsigns diffthis<cr>", "Git diff" },
--         },
--         d = {
--           name = "Diagnostics",
--           -- j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next diagnostic" },
--           -- k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous diagnostic" },
--           j = { "<cmd>lua vim.diagnostic.goto_next({float = false})<cr>", "Next diagnostic" },
--           k = { "<cmd>lua vim.diagnostic.goto_prev({float = false})<cr>", "Previous diagnostic" },
--           b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
--           d = { "<cmd>Telescope diagnostics theme=get_ivy<cr>", "Diagnostics" },
--         },
--         l = {
--           name = "Language Server",
--           f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
--           r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename references" },
--           d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
--           D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to definition" },
--           s = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Symbol information" },
--           i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "List all the implementations" },
--           t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Jump to the type definition" },
--           R = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
--         },
--         D = {
--           name = "Debug",
--           c = { "<cmd>checkhealth<cr>", "Check health" },
--           t = { "<cmd>TSConfigInfo<cr>", "TreeSitter information" },
--           l = { "<cmd>LspInfo<cr>", "LSP information" },
--         },
--       }, { prefix = "<leader>" })
--
--       -- TODO
--
--       -- Move around splits
--       vim.api.nvim_set_keymap("n", "<C-J>", "<C-W>j", { noremap = true, silent = true })
--       vim.api.nvim_set_keymap("n", "<C-K>", "<C-W>k", { noremap = true, silent = true })
--       vim.api.nvim_set_keymap("n", "<C-L>", "<C-W>l", { noremap = true, silent = true })
--       vim.api.nvim_set_keymap("n", "<C-H>", "<C-W>h", { noremap = true, silent = true })
--
--       -- Move around buffers
--       vim.api.nvim_set_keymap("n", "<C-N>", ":bnext<cr>", { noremap = true, silent = true })
--       vim.api.nvim_set_keymap("n", "<C-P>", ":bprev<cr>", { noremap = true, silent = true })
--
--       -- Close current window
--       vim.api.nvim_set_keymap("n", "<C-C>", ":close<CR>", { noremap = true, silent = true })
--     end
--   }
