return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      dim = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      scope = { enabled = true },
      zen = { enabled = true },
    },
  },

  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        "arduino",
        "astro",
        "css",
        "dockerfile",
        "eex",
        "elixir",
        "fish",
        "gitignore",
        "go",
        "heex",
        "html",
        "html",
        "json",
        "lua",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "rust",
        "scss",
        "svelte",
        "typescript",
        "vim",
        "vimdoc",
  		},
  	},
  },
}
