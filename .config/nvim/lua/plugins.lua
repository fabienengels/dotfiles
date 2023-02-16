return {
	{
		"folke/noice.nvim",
		enabled = false,
		config = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				enabled = false,
				opts = {
					background_colour = "#000000",
				},
			},
		},
	},
	{
		"goolord/alpha-nvim",
		enabled = false,
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	{
		"folke/todo-comments.nvim",
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
		},
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		tag = "release",
		opts = {
			numhl = false,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"folke/neodev.nvim",
		config = true,
	},
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		opts = {
			options = {
				globalstatus = true,
			},
		},
	},
	{
		"kdheepak/tabline.nvim",
		opts = {
			enable = true,
			options = {
				section_separators = { "", "" },
				component_separators = { "", "" },
				show_filename_only = false,
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			char = "┊",
			show_trailing_blankline_indent = false,
			enabled = true,
			use_treesitter = true,
			show_first_indent_level = false,
			show_current_context = false,
			show_current_context_start = false,
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = { check_ts = true },
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = true,
	},
	{
		"simrat39/rust-tools.nvim",
		config = true,
	},
	{
		"karb94/neoscroll.nvim",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"folke/which-key.nvim",
	},
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"neanias/everforest-nvim",
		enabled = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 1,
			})

			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		-- TODO test
		"rebelot/kanagawa.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				dimInactive = true,
				-- theme = "light",
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = true,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = { null_ls.builtins.formatting.stylua },
			})
		end,
	},
}
