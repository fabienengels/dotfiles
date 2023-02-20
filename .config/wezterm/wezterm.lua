local wezterm = require("wezterm")

return {
	font = wezterm.font("JetBrains Mono"),
	font_size = 13,
	enable_tab_bar = false,
	-- https://wezfurlong.org/wezterm/colorschemes/index.html
	color_scheme = "kanagawabones",
	window_background_opacity = 0.9,
	default_prog = { "fish" },
	allow_square_glyphs_to_overflow_width = "Always",
}
