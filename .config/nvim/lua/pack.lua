vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd "nvim-treesitter"
      end
      vim.cmd "TSUpdate"
    end
  end,
})

vim.pack.add {
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
}

-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
require("nvim-treesitter").install {
  "astro",
  "bash",
  "c",
  "caddy",
  "cmake",
  "cpp",
  "css",
  "dockerfile",
  "eex",
  "elixir",
  "fish",
  "glsl",
  "go",
  "heex",
  "html",
  "ini",
  "javascript",
  "jinja",
  "json",
  "just",
  "lua",
  "markdown",
  "nix",
  "nu",
  "python",
  "rust",
  "ssh_config",
  "svelte",
  "terraform",
  "toml",
  "typescript",
  "typst",
  "yaml",
}

local Conform = require "conform"

Conform.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

-- https://github.com/catppuccin/nvim
require("catppuccin").setup {
  transparent_background = true,
  float = {
    solid = true,
  },
}

vim.cmd.colorscheme "catppuccin-nvim"

require("gitsigns").setup()
