return {
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
