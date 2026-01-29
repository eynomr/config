local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local actions = wezterm.action

config.initial_cols = 120
config.initial_rows = 28
config.hide_tab_bar_if_only_one_tab = true
-- config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.automatically_reload_config = true
config.check_for_updates = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.color_scheme = "rose-pine"
local palette = {
  base = "#191724",
  surface = "#1f1d2e",
  overlay = "#26233a",
  muted = "#6e6a86",
  subtle = "#908caa",
  text = "#e0def4",
  foam = "#9ccfd8",
  iris = "#c4a7e7",
}
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 12.5

config.window_padding = {
    left = 7,
    right = 7,
    top = 7,
    bottom = 7
}

config.window_frame = {
  active_titlebar_bg = "#191724",
  inactive_titlebar_bg = "#191724",
}

config.colors = {
  tab_bar = {
    background = "#191724", -- base

    active_tab = {
      bg_color = "#1f1d2e", -- surface
      fg_color = "#e0def4", -- text
      intensity = "Bold",
    },

    inactive_tab = {
      bg_color = "#191724", -- base
      fg_color = "#6e6a86", -- muted
    },

    inactive_tab_hover = {
      bg_color = "#26233a", -- overlay
      fg_color = "#e0def4",
    },

    new_tab = {
      bg_color = "#191724",
      fg_color = "#908caa", -- subtle
    },

    new_tab_hover = {
      bg_color = "#26233a",
      fg_color = "#e0def4",
    },
  },
}

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)

    local bg = palette.base
    local fg = palette.muted

    if tab.is_active then
        bg = palette.surface
        fg = palette.text
    elseif hover then
        bg = palette.overlay
        fg = palette.text
    elseif tab.is_last_active then
        bg = palette.base
        fg = palette.subtle
   end

   local edge_bg = palette.base
   local edge_fg = palette.overlay

   return {
       { Background = { Color = edge_bg } },
       { Foreground = { Color = edge_fg } },
       { Text = "|" },

       { Background = { Color = bg } },
        { Foreground = { Color = fg } },
        { Attribute = { Intensity = tab.is_active and "Bold" or "Normal" } },
        { Text = "  " .. title .. "  " },

        { Background = { Color = edge_bg } },
        { Foreground = { Color = edge_fg } },
        { Text = "│" },
   }
  end
)

config.keys = {
    {
        key = 'x',
        mods = 'SUPER',
        action = actions.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key="Enter",
        mods="SHIFT",
        action=wezterm.action { SendString="\x1b\r" }
    },
    {
        key = 'e',
        mods = 'SUPER',
        action = actions.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'k',
        mods = 'SUPER',
        action = actions.CloseCurrentPane { confirm = true },
    },
    {
        key = 's',
        mods = 'SUPER',
        action = actions.ShowTabNavigator
    },
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = actions.SendKey { key = 'b', mods = 'ALT' }
    },
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = actions.SendKey { key = 'f', mods = 'ALT' }
    },
    {
        key = 'h',
        mods = 'SUPER | CTRL',
        action = actions { ActivatePaneDirection = "Prev" }
    },
    {
        key = 'l',
        mods = 'SUPER | CTRL',
        action = actions { ActivatePaneDirection = "Next" }
    }
}

return config
