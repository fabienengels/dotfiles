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
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
}

local languages = {
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
  "ron",
  "rust",
  "ssh_config",
  "svelte",
  "terraform",
  "toml",
  "tsx",
  "typescript",
  "typst",
  "yaml",
}

-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function()
    vim.treesitter.start() -- highlighting
  end,
})

local Conform = require "conform"

Conform.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    svelte = { "prettier" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 3000,
    lsp_format = "fallback",
  },
}

require("nvim-tree").setup { filters = { dotfiles = true } }

-- Run :KanagawaCompile after a change
require("kanagawa").setup {
  compilation = true,
  transparent = true,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
}

vim.cmd.colorscheme "kanagawa"

require("lualine").setup {
  options = {
    theme = "auto",
  },
  sections = {
    lualine_c = { {
      "filename",
      path = 1,
    } },
  },
}

require("gitsigns").setup()
require("ibl").setup {
  enabled = false,
  indent = {
    -- char = "┆",
    char = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
  },
  scope = {
    enabled = false,
  },
}
