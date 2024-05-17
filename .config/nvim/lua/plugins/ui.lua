
return {
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
    "karb94/neoscroll.nvim",
    config = true,
  },
  {
    "catppuccin/nvim",
    enabled = true,
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    flavor = "mocha",
    opts = {
      transparent_background = true,
    }
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
}
