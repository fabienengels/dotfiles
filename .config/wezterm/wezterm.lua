local config = {
	font_size = 13,
	enable_tab_bar = false,
	color_scheme = "kanagawabones",
	window_background_opacity = 0.9,
	default_prog = { "fish" },
	allow_square_glyphs_to_overflow_width = "Always",
}

local has_override, override = pcall(require, "override")

if has_override then
  for k,v in pairs(override) do config[k] = v end
end

return config
