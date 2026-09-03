-- ┌─────────────────────────┐
-- │ Plugins outside of MINI │
-- └─────────────────────────┘
--
-- This file contains installation and configuration of plugins outside of MINI.
-- They significantly improve user experience in a way not yet possible with MINI.
-- These are mostly plugins that provide programming language specific behavior.
--
-- Use this file to install and configure other such plugins.

-- Make concise helpers for installing/adding plugins in two stages
local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

-- Tree-sitter ================================================================

-- Tree-sitter is a tool for fast incremental parsing. It converts text into
-- a hierarchical structure (called tree) that can be used to implement advanced
-- and/or more precise actions: syntax highlighting, textobjects, indent, etc.
--
-- Tree-sitter support is built into Neovim (see `:h treesitter`). However, it
-- requires two extra pieces that don't come with Neovim directly:
-- - Language parsers: programs that convert text into trees. Some are built-in
--   (like for Lua), 'nvim-treesitter' provides many others.
--   NOTE: It requires third party software to build and install parsers.
--   See the link for more info in "Requirements" section of the MiniMax README.
-- - Query files: definitions of how to extract information from trees in
--   a useful manner (see `:h treesitter-query`). 'nvim-treesitter' also provides
--   these, while 'nvim-treesitter-textobjects' provides the ones for Neovim
--   textobjects (see `:h text-objects`, `:h MiniAi.gen_spec.treesitter()`).
--
-- Add these plugins now if file (and not 'mini.starter') is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.treesitter nvim-treesitter` to see potential issues.
-- - In case of errors related to queries for Neovim bundled parsers (like `lua`,
--   `vimdoc`, `markdown`, etc.), manually install them via 'nvim-treesitter'
--   with `:TSInstall <language>`. Be sure to have necessary system dependencies
--   (see MiniMax README section for software requirements).
now_if_args(function()
	-- Define hook to update tree-sitter parsers after plugin is updated
	local ts_update = function()
		vim.cmd("TSUpdate")
	end
	Config.on_packchanged("nvim-treesitter", { "update" }, ts_update, ":TSUpdate")

	add({
		"https://github.com/nvim-treesitter/nvim-treesitter",
		"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	})

	-- Define languages which will have parsers installed and auto enabled
	-- After changing this, restart Neovim once to install necessary parsers. Wait
	-- for the installation to finish before opening a file for added language(s).
	local languages = {
		"astro",
		"bash",
		"c",
		"caddy",
		"cpp",
		"css",
		"csv",
		"cuda",
		"diff",
		"dockerfile",
		"eex",
		"elixir",
		"fish",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"glsl",
		"go",
		"gomod",
		"hcl",
		"heex",
		"html",
		"htmldjango",
		"ini",
		"jinja",
		"jq",
		"jsdoc",
		"json",
		"json5",
		"just",
		"lua",
		"make",
		"markdown",
		"nix",
		"nu",
		"python",
		"regex",
		"rust",
		"scss",
		"sql",
		"ssh_config",
		"svelte",
		"toml",
		"typescript",
		"typst",
		"vimdoc",
		"yaml",
	}
	local isnt_installed = function(lang)
		return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
	end
	local to_install = vim.tbl_filter(isnt_installed, languages)
	if #to_install > 0 then
		require("nvim-treesitter").install(to_install)
	end

	-- Enable tree-sitter after opening a file for a target language
	local filetypes = {}
	for _, lang in ipairs(languages) do
		for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
			table.insert(filetypes, ft)
		end
	end
	local ts_start = function(ev)
		vim.treesitter.start(ev.buf)
	end
	Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)

-- Language servers ===========================================================

-- Add it now if file (and not 'mini.starter') is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.lsp` to see potential issues.
now_if_args(function()
	add({ "https://github.com/neovim/nvim-lspconfig" })
	add({ "https://github.com/mason-org/mason.nvim" })
	add({ "https://github.com/mason-org/mason-lspconfig.nvim" })

	local languages = {
		-- "ansible_ls",
		"astro",
		"bashls",
		"biome",
		"clangd",
		"dockerls",
		-- "glsl_analyzer",
		"gopls",
		"htmx",
		"just",
		"kcl",
		"kdl_lsp",
		"lua_ls",
		"marksman",
		"nil_ls",
		"nushell",
		"tofu_ls",
		"postgres_lsp",
		"pyright",
		"ruff",
		"rust_analyzer",
		"stylua",
		"superhtml",
		"svelte",
		"tailwindcss",
		"tombi",
		"tinymist",
		"yamlls",
	}
	require("mason").setup({
		firewall = {
			enabled = true,
			auto_managed = true,
		},
	})

	-- Mason <-> LSP bridge (Mason 2.x itself no longer auto-installs LSP servers):
	-- - `ensure_installed`: install these servers via Mason at startup if missing.
	-- - Only servers that Mason should *own* are listed here. System-installed
	--   servers (gopls, clangd, pyright, ...) are deliberately omitted so Mason
	--   doesn't download duplicate copies that would shadow them. (Note: Mason's
	--   bin dir is prepended to PATH, so a Mason-installed binary always wins
	--   over a same-named system binary — e.g. the leftover rustup shim).
	-- - `dockerls` is omitted: the Mason registry maps it to the wrong package
	--   (dockerfile-language-server), while lspconfig expects `docker-langserver`
	--   from docker-language-server (installed in the Mason bin dir manually).
	-- - `kdl_lsp` and `nushell` are omitted: no package exists in the Mason registry.
	-- - Anything installed via Mason is enabled automatically (automatic_enable
	--   default), and `:LspInstall <server>` installs + enables on demand.
	require("mason-lspconfig").setup({
		ensure_installed = {
			"astro",
			"htmx",
			"just",
			"kcl",
			"postgres_lsp",
			"rust_analyzer",
			"svelte",
			"tofu_ls",
		},
	})

	vim.lsp.enable(languages)
end)

-- Formatting =================================================================

later(function()
	add({ "https://github.com/stevearc/conform.nvim" })

	-- See also:
	-- - `:h Conform`
	-- - `:h conform-options`
	-- - `:h conform-formatters`
	require("conform").setup({
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			bash = { "shfmt" },
			fish = { "fish_indent" },
			go = { "goimports" },
			lua = { "stylua" },
			python = { "ruff" },
			rust = { "rustfmt" },
			svelte = { "prettier" },
		},
	})
end)

-- Snippets ===================================================================

-- Although 'mini.snippets' provides functionality to manage snippet files, it
-- deliberately doesn't come with those.
--
-- The 'rafamadriz/friendly-snippets' is currently the largest collection of
-- snippet files. They are organized in 'snippets/' directory (mostly) per language.
-- 'mini.snippets' is designed to work with it as seamlessly as possible.
-- See `:h MiniSnippets.gen_loader.from_lang()`.
later(function()
	add({ "https://github.com/rafamadriz/friendly-snippets" })
end)

-- Git signs ==================================================================

later(function()
	add({ "https://github.com/lewis6991/gitsigns.nvim" })
	require("gitsigns").setup()
end)

Config.now(function()
	add({
		"https://github.com/catppuccin/nvim",
		"https://github.com/nvim-lualine/lualine.nvim",
	})

	require("catppuccin").setup({
		transparent_background = true,
		float = {
			transparent = true,
		},
	})

	require("lualine").setup()

	vim.cmd("color catppuccin")
end)
