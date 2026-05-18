require("mini.basics").setup {
	options = {
		extra_ui = true,
	},
	mappings = {
		basics = true,
		windows = true,
	},
}

require("mini.tabline").setup()
require("mini.statusline").setup()
require("mini.completion").setup()
require("mini.keymap").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
