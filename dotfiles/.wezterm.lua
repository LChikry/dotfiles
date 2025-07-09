local wezterm = require "wezterm"

local config = wezterm.config_builder()
config.default_cwd = (wezterm.home_dir .. "/LC")

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.87
config.macos_window_background_blur = 10
config.color_scheme = 'Ayu Mirage'
config.font_size = 18
config.line_height = 1.07
config.max_fps = 120

config.font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font Mono",
	"Cairo",
})

config.bidi_enabled = true
config.harfbuzz_features = {
    "calt",
    "clig",
    "liga",
}

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