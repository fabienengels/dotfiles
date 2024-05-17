return {
  {
    "windwp/nvim-autopairs",
    opts = { check_ts = true },
  },
  {
    "simrat39/rust-tools.nvim",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "j-hui/fidget.nvim",
    tag = 'legacy',
    event = "LspAttach",
    opts = {}
  },
}
