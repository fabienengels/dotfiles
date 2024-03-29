return {
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
    config = {
      ui = {
        check_outdated_packages_on_open = true,
      },
    },
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
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
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
    main = "ibl",
    opts = {
    },
    config = function ()
      require("ibl").setup({
        scope = {
          enabled = false
        },
        indent = {
          char = "┊",
        }
      })

      local hooks = require "ibl.hooks"
      hooks.register(
        hooks.type.WHITESPACE,
        hooks.builtin.hide_first_space_indent_level
      )
    end
  },
  {
    "windwp/nvim-autopairs",
    opts = { check_ts = true },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
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
    -- TODO test
    "rebelot/kanagawa.nvim",
    enabled = true,
    priority = 1000,
    config = function()
      vim.opt.laststatus = 3
      vim.opt.fillchars:append({
        horiz = "━",
        horizup = "┻",
        horizdown = "┳",
        vert = "┃",
        vertleft = "┨",
        vertright = "┣",
        verthoriz = "╋",
      })
      require("kanagawa").setup({
        transparent = true,
        dimInactive = true,
        globalStatus = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = 'legacy',
    event = "LspAttach",
    opts = {}
  },
}
