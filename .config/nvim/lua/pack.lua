vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd "nvim-treesitter"
      end
      vim.cmd "TSUpdate"
    end

    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      vim.system({ "make" }, { cwd = ev.data.path }):wait()
    end
  end,
})

vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
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
  "tsx",
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

require("telescope").setup {}
require("telescope").load_extension "fzf"

-- https://github.com/catppuccin/nvim
require("catppuccin").setup {
  flavor = "mocha",
  transparent_background = true,
  term_colors = true,
  float = {
    solid = true,
  },
}

vim.cmd.colorscheme "catppuccin-nvim"

require("lualine").setup {
  options = {
    theme = "catppuccin-nvim",
  },
}

require("gitsigns").setup()
