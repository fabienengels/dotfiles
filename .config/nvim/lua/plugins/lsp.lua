return {
  {
    "neovim/nvim-lspconfig",
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
}
