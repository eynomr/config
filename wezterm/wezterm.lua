local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local actions = wezterm.action

config.initial_cols = 120
config.initial_rows = 28
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.color_scheme = 'Afterglow'
config.font = wezterm.font("Ubuntu Mono")
config.font_size = 14.0
config.line_height = 1.1

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
