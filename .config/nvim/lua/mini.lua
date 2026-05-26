require("mini.basics").setup {
  -- options = {
  --   extra_ui = true,
  -- },
  mappings = {
    windows = true,
  },
}

require("mini.notify").setup {
  -- only show messages
  content = {
    format = function(notif)
      return notif.msg
    end,
  },
}

require("mini.surround").setup()
require("mini.ai").setup()
require("mini.pick").setup()
require("mini.extra").setup()
require("mini.icons").setup()
require("mini.tabline").setup()
require("mini.keymap").setup()
require("mini.pairs").setup()
require("mini.completion").setup {
  lsp_completion = {
    auto_setup = true,
  },
}

-- TODO : mini.snippets
-- TODO : https://github.com/rafamadriz/friendly-snippets
-- TODO : mini.diff
