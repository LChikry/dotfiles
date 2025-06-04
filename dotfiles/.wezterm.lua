local wezterm = require "wezterm"

local config = wezterm.config_builder()
config.default_cwd = (wezterm.home_dir .. "/LC")

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.87
config.macos_window_background_blur = 10
config.color_scheme = 'Ayu Mirage'
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 18

config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800


config.keys = {
	{
		key = 'mapped:h',
		mods = 'CMD|SHIFT',
		action = wezterm.action.SendKey { key = 'b', mods = 'ALT'}
	},
	{
		key = 'mapped:l',
		mods = 'CMD|SHIFT',
		action = wezterm.action.SendKey { key = 'f', mods = 'ALT' },
	},
	{
		key = 'mapped:k',
		mods = 'CMD|SHIFT',
		action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
	},
		{
		key = 'mapped:j',
		mods = 'CMD|SHIFT',
		action = wezterm.action.SendKey { key = 'i', mods = 'CTRL' },
	},
	{
		key = 'mapped:Backspace',
		mods = 'CMD|SHIFT',
		action = wezterm.action.SendKey { key = 'w', mods = 'CTRL' },
	},
	{
		key = 'mapped:Backspace',
		mods = 'CMD',
		action = wezterm.action.SendKey { key = 'u', mods = 'CTRL' },
	}
}

config.window_close_confirmation = "NeverPrompt"
return config