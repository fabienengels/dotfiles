local wezterm = require 'wezterm'
local action = wezterm.action

local config = {
  font = wezterm.font "JetBrains Mono",
  font_size = 13,
  color_scheme = "kanagawabones",
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.95,
  macos_window_background_blur = 15,
  default_prog = { "fish" },
  allow_square_glyphs_to_overflow_width = "Always",
  native_macos_fullscreen_mode = true,
  audible_bell = "Disabled",
  pane_focus_follows_mouse = true,
  hide_mouse_cursor_when_typing = false,
  keys = {
    {
      key = 't',
      mods = 'CTRL',
      action = action.SpawnTab 'CurrentPaneDomain'
    }
  }
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = action.ActivateTab(i - 1)
  })
end

local has_override, override = pcall(require, "override")

if has_override then
  for k,v in pairs(override) do config[k] = v end
end

return config
