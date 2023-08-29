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
  completeopt = { "menu", "menuone", "noselect" },
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

--  _
-- | | __ _ _____   _
-- | |/ _` |_  / | | |
-- | | (_| |/ /| |_| |
-- |_|\__,_/___|\__, |
--              |___/

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins")

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("which-key").register({
  ["w"] = { "<cmd>w!<cr>", "Save" },
  ["q"] = { "<cmd>q!<cr>", "Quit" },
  ["c"] = { "<cmd>BufferKill<cr>", "Close Buffer" },
  b = {
    name = "Buffers",
    f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
  },
  f = {
    name = "Files",
    g = { "<cmd>Telescope git_files<cr>", "Find git file" }, -- create a binding with label
    f = { "<cmd>Telescope find_files<cr>", "Find file" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
    n = { "New File" }, -- just a label. don't create any mapping
    e = "Edit File", -- same as above
  },
  g = {
    name = "Git",
    j = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
    k = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
    p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
    R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
    s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
    u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Git diff" },
  },
  d = {
    name = "Diagnostics",
    -- j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next diagnostic" },
    -- k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous diagnostic" },
    j = { "<cmd>lua vim.diagnostic.goto_next({float = false})<cr>", "Next diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev({float = false})<cr>", "Previous diagnostic" },
    b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    d = { "<cmd>Telescope diagnostics theme=get_ivy<cr>", "Diagnostics" },
  },
  l = {
    name = "Language Server",
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename references" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to definition" },
    s = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Symbol information" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "List all the implementations" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Jump to the type definition" },
    R = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
  },
  D = {
    name = "Debug",
    c = { "<cmd>checkhealth<cr>", "Check health" },
    t = { "<cmd>TSConfigInfo<cr>", "TreeSitter information" },
    l = { "<cmd>LspInfo<cr>", "LSP information" },
  },
}, { prefix = "<leader>" })

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "vim",
    "markdown",
    "markdown_inline",
    "arduino",
    "astro",
    "dockerfile",
    "eex",
    "elixir",
    "fish",
    "gitignore",
    "heex",
    "help",
    "html",
    "json",
    "lua",
    "nix",
    "python",
    "rust",
    "scss",
    "svelte",
    "typescript",
  },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  disable = function (buf)
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    return ok and stats and stats.size > 100 * 1024
  end,
  indent = { enable = true, disable = { "yaml" } },
  rainbow = { enable = true, extended_mode = true },
  -- context_commentstring = { enable = true }
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "<c-backspace>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("gr", require("telescope.builtin").lsp_references)
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  -- if client.supports_method("textDocument/formatting") then
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })

  -- Create a command `:Format` local to the LSP buffer
  -- vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
  -- 	if vim.lsp.buf.format then
  -- 		vim.lsp.buf.format()
  -- 	elseif vim.lsp.buf.formatting then
  -- 		vim.lsp.buf.formatting()
  -- 	end
  -- end, { desc = "Format current buffer with LSP" })
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

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
  "ansiblels",
  "arduino_language_server",
  "astro",
  "bashls",
  "dockerls",
  "efm",
  "elixirls",
  "jsonls",
  "lua_ls",
  -- "nil_ls",
  "pyright",
  "rust_analyzer",
  "svelte",
  "tailwindcss",
  "tsserver",
  "yamlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require("lspconfig").yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      keyordering = false,
    },
  },
})

local runtime_path = vim.split(package.path, ";", {})
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = runtime_path },
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
      format = {
        enable = false,
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "luasnip" },
    -- { name = 'nvim_lsp_signature_help' },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- Indent with Tab
vim.api.nvim_set_keymap("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Tab>", ">><Esc>gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<<<Esc>gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<ESC>", ":noh<return><ESC>", { noremap = true, silent = true })

-- Move around splits
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W>h", { noremap = true, silent = true })

-- Move around buffers
vim.api.nvim_set_keymap("n", "<C-N>", ":bnext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-P>", ":bprev<cr>", { noremap = true, silent = true })

-- Close current window
vim.api.nvim_set_keymap("n", "<C-C>", ":close<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
