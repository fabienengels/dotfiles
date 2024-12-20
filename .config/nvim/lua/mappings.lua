require "nvchad.mappings"

local map = vim.keymap.set

-- Indent with Tab
map("n", "<Tab>", ">>", { noremap = true, silent = true })
map("n", "<S-Tab>", "<<", { noremap = true, silent = true })
map("v", "<Tab>", ">><Esc>gv", { noremap = true, silent = true })
map("v", "<S-Tab>", "<<<Esc>gv", { noremap = true, silent = true })

-- Stop search highlight
map("n", "<ESC>", ":noh<return><ESC>", { noremap = true, silent = true })

-- Buffers
map("n", "<C-N>", ":bnext<cr>", { noremap = true, silent = true })
map("n", "<C-P>", ":bprev<cr>", { noremap = true, silent = true })

-- Telescope
map("n", "fg", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
map("n", "ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })

-- Git
map("n", "gj", "<cmd>Gitsigns next_hunk<cr>", { noremap = true, silent = true })
map("n", "gk", "<cmd>Gitsigns prev_hunk<cr>", { noremap = true, silent = true })
map("n", "gp", "<cmd>Gitsigns preview_hunk<cr>", { noremap = true, silent = true })
map("n", "gr", "<cmd>Gitsigns reset_hunk<cr>", { noremap = true, silent = true })
map("n", "gR", "<cmd>Gitsigns reset_buffer<cr>", { noremap = true, silent = true })
map("n", "gs", "<cmd>Gitsigns stage_hunk<cr>", { noremap = true, silent = true })
map("n", "gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { noremap = true, silent = true })
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
