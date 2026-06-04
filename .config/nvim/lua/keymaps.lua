vim.g.mapleader = " "

local map = vim.keymap.set

map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

map("v", "<", "<gv", { desc = "Unindent and keep selection" })
map("v", ">", ">gv", { desc = "Indent and keep selection" })

map("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

map("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor centered" })

map("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

map("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

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

map("n", "<leader>i", "<cmd>IBLToggle<cr>", { desc = "Toggle indent lines", silent = true })

map("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Nvim Tree", silent = true })

map("n", "<leader>f", "<cmd>Pick files<cr>", { desc = "Pick files" })
map("n", "<leader>g", "<cmd>Pick git_files<cr>", { desc = "Pick git files" })
map("n", "<leader>b", "<cmd>Pick buffers<cr>", { desc = "Pick git files" })

map("n", "<C-c>", ":bdelete<CR>", { desc = "Close current buffer", silent = true })
map("n", "<Tab>", ":bnext<CR>", { desc = "Cycle to the next buffer", silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Cycle to the previous buffer", silent = true })

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>hs", vim.lsp.buf.signature_help, { desc = "Signature help" })

map("n", "<leader>U", vim.pack.update, { desc = "Update plugins" })

local pickers = require("mini.extra").pickers
map("n", "<leader>s", function()
  pickers.lsp { scope = "document_symbol" }
end, { desc = "Document symbols" })
map("n", "<leader>S", function()
  pickers.lsp { scope = "workspace_symbol" }
end, { desc = "Workspace symbols" })
map("n", "<leader>d", function()
  pickers.diagnostic { scope = "current" }
end, { desc = "Diagnostic (current file)" })
map("n", "<leader>D", function()
  pickers.diagnostic { scope = "all" }
end, { desc = "Diagnostic (all)" })

map({ "n", "x", "o" }, "gw", function()
  require("flash").jump()
end)

-- TODO
-- map({ "n", "x", "o" }, "<leader>J", function()
--   require("flash").treesitter()
-- end)
