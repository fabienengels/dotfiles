return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vim",
          "markdown",
          "markdown_inline",
          "arduino",
          "astro",
          "dockerfile",
          "eex",
          "elixir",
          "fish",
          "gitignore",
          "heex",
          "html",
          "json",
          "lua",
          "nix",
          "python",
          "rust",
          "scss",
          "svelte",
          "typescript",
        },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        disable = function (buf)
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and stats and stats.size > 100 * 1024
        end,
        indent = { enable = true, disable = { "yaml" } },
        rainbow = { enable = true, extended_mode = true },
        -- context_commentstring = { enable = true }
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end
  },
}
