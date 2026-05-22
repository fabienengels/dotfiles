vim.g.mapleader = " "

local map = vim.keymap.set

-- Delete text without saving it to any register
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

map("v", "<", "<gv", { desc = "Unindent and keep selection" })
map("v", ">", ">gv", { desc = "Indent and keep selection" })

map("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

map("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

map("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

local telescope = require "telescope.builtin"
map("n", "<leader>f", telescope.git_files, { desc = "Find git files" })

map("n", "<leader>u", function()
  vim.cmd.packadd "nvim.undotree"
  require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

local diagnostic_goto = function(next, severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump { count = next and 1 or -1, float = false, severity = severity }
  end
end

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
