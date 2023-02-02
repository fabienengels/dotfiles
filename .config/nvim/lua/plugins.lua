return {
  {
    'folke/noice.nvim',
    enabled = false,
    config = function()
      require('noice').setup({})
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        enabled = false,
        config = function()
          require('notify').setup({
            background_colour = '#000000'
          })
        end
      }
    }
  },
  {
    'goolord/alpha-nvim',
    enabled = false,
    config = function()
      require('alpha').setup(
        require('alpha.themes.dashboard').config
      )
    end
  },
  {
    "folke/todo-comments.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim"
    },
    config = function ()
      require("todo-comments").setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function()
      require('gitsigns').setup({
        numhl = false,
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' }
        }
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies= {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'folke/neodev.nvim',
    config = function()
      require("neodev").setup({})
    end
  },
  {
    'williamboman/mason.nvim'
  },
  {
    'williamboman/mason-lspconfig.nvim'
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
          }
        }
      }
      require('telescope').load_extension('fzf')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true
        }
      })
    end
  },
  {
    'kdheepak/tabline.nvim',
    config = function()
      require("tabline").setup({
        enable = true,
        options = {
          section_separators = { "", "" },
          component_separators = { "", "" },
          show_filename_only = false
        }
      })
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        char = '┊',
        show_trailing_blankline_indent = false,
        enabled = true,
        use_treesitter = true,
        show_first_indent_level = false,
        show_current_context = false,
        show_current_context_start = false
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({ check_ts = true })
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  {
    'simrat39/rust-tools.nvim',
    config = function()
      require('rust-tools').setup({})
    end
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'folke/which-key.nvim'
  },
  {
    'glepnir/lspsaga.nvim',
    enabled = false,
    event = 'BufRead',
    config = function()
      require('lspsaga').setup({})
    end
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin"
  },
  { 'neanias/everforest-nvim',
    enabled = true,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 1
      })

      vim.cmd("colorscheme everforest")
    end
  },
  {
    -- TODO test
    "rebelot/kanagawa.nvim",
    enabled = false,
    priority = 1000,
    config = function ()
      vim.cmd("colorscheme kanagawa")
    end
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require("fidget").setup({})
    end
  }
}
