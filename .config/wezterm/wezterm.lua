local config = {
  font_size = 13,
  color_scheme = "kanagawabones",
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.9,
  default_prog = { "fish" },
  allow_square_glyphs_to_overflow_width = "Always",
  native_macos_fullscreen_mode = true,
  audible_bell = "Disabled",
  pane_focus_follows_mouse = true
}

local has_override, override = pcall(require, "override")

if has_override then
  for k,v in pairs(override) do config[k] = v end
end

return config
