local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local actions = wezterm.action

config.initial_cols = 120
config.initial_rows = 28
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.automatically_reload_config = true
config.check_for_updates = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.color_scheme = 'Afterglow'
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 12.5

config.window_padding = {
    left = 7,
    right = 0,
    top = 2,
    bottom = 0
}

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
