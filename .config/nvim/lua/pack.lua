vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd "nvim-treesitter"
      end
      vim.cmd "TSUpdate"
    end

    -- if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
    --   vim.system({ "make" }, { cwd = ev.data.path }):wait()
    -- end
  end,
})

vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  -- "https://github.com/nvim-telescope/telescope.nvim",
  -- "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/rebelot/kanagawa.nvim",
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
    timeout_ms = 3000,
    lsp_format = "fallback",
  },
}

require("nvim-tree").setup { filters = { dotfiles = true } }

-- Create an augroup for nvim-tree setup
-- local nvim_tree_git_group = vim.api.nvim_create_augroup("NvimTreeGitOpen", { clear = true })

-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = nvim_tree_git_group,
--   callback = function()
--     -- Check if the current working directory contains a .git folder
--     local cwd = vim.fn.getcwd()
--     local is_git_repo = vim.fn.isdirectory(cwd .. "/.git") == 1
--
--     if is_git_repo then
--       -- Open nvim-tree without taking focus away from the main buffer
--       require("nvim-tree.api").tree.open { focus = false }
--     end
--   end,
-- })

-- require("telescope").setup {}
-- require("telescope").load_extension "fzf"

-- https://github.com/catppuccin/nvim
-- require("catppuccin").setup {
--   flavor = "mocha",
--   transparent_background = true,
--   -- auto_integrations = true,
--   term_colors = true,
--   float = {
--     transparent = false,
--   },
-- }

-- Run :KanagawaCompile after a change
require("kanagawa").setup {
  -- overrides = function(colors)
  --   return {
  --     -- Define the master style on one group
  --     ["@lsp.mod.macro.rust"] = { fg = colors.palette.dragonOrange, bold = false, italic = true },
  --     ["@lsp.type.decorator.rust"] = { link = "@lsp.mod.macro.rust" },
  --     ["@lsp.type.attributeBracket.rust"] = { link = "@lsp.mod.macro.rust" },
  --
  --     -- Link the other groups to the master group
  --     -- ["@attribute.rust"] = { link = "@lsp.type.decorator.rust" },
  --     -- ["rustAttribute"] = { link = "@lsp.type.decorator.rust" },
  --     -- ["rustDerive"] = { link = "@lsp.type.decorator.rust" },
  --     -- ["@lsp.type.derive.rust"] = { link = "@lsp.type.decorator.rust" },
  --   }
  -- end,
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

-- vim.cmd.colorscheme "catppuccin-nvim"
vim.cmd.colorscheme "kanagawa"

require("lualine").setup {
  options = {
    theme = "auto",
    -- theme = "catppuccin-nvim",
  },
  sections = {
    lualine_c = { {
      "filename",
      path = 1,
    } },
  },
}

require("gitsigns").setup()
