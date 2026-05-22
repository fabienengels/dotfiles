require("mini.basics").setup {
  options = {
    extra_ui = true,
  },
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

-- require("mini.cmdline").setup {
--   autocorrect = { enable = false },
-- }

require("mini.surround").setup()

-- TODO
require("mini.pick").setup()

-- TODO
require("mini.extra").setup()

require("mini.completion").setup {
  lsp_completion = {
    auto_setup = true,
  },
}

require("mini.icons").setup()

-- TODO : mini.snippets
-- TODO : mini.diff

require("mini.tabline").setup()
-- require("mini.statusline").setup()
require("mini.keymap").setup()
require("mini.pairs").setup()
require("mini.jump2d").setup {}
