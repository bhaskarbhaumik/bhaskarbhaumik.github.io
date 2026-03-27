local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

local appearance = wezterm.gui.get_appearance()
local tab_icon = "🔵"
local pane_split_color = "#0060db"

-- local darkcolor_scheme = 'OneDark (base16)'
-- local lightcolor_scheme = 'OneLight (base16)'
local darkcolor_scheme = "OneHalfDark"
local lightcolor_scheme = "OneHalfLight"

-- function to get the host part of the hostname
local function get_host(host_domain)
	if string.match(host_domain, "^%d+%.%d+%.%d+%.%d+$") then
		return string.lower(host_domain:gsub("%.", "-"))
	else
		return string.lower(host_domain:gsub("%..*$", ""))
	end
end

local hostname = "tcs"
-- local hostname = get_host(wezterm.hostname())
-- wezterm.log_info("hello world! my name is " .. wezterm.hostname())

wezterm.on("gui-startup", function(cmd)
	local active = wezterm.gui.screens().active
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:guiwindow():setposition(active.x, active.y)
	window:guiwindow():set_innersize(active.width, active.height)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#181818"
	local foreground = "#808080"
	if tab.is_active then
		background = "#222222" -- '#2b2042'
		foreground = "#c0c0c0"
	elseif hover then
		background = "#222222" -- '#3b3052'
		foreground = "#909090"
	end
	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{
			Text = "⟨"
				.. tab_icon
				.. " "
				.. hostname
				.. " ⌘ "
				.. (tab.tab_index + 1)
				.. "⟩ "
				.. tab.active_pane.title
				.. "  ",
		},
	}
end)
config.use_fancy_tab_bar = true
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = true
config.mouse_bindings = {
	{ event = { Down = { streak = 1, button = "Right" } }, mods = "NONE", action = act.PasteFrom("Clipboard") }, -- Right click sends "woot" to the terminal
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	}, -- Change the default click behavior so that it only selects text and doesn't open hyperlinks
	{ event = { Up = { streak = 1, button = "Left" } }, mods = "CTRL", action = act.OpenLinkAtMouseCursor }, -- and make CTRL-Click open hyperlinks
}
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMonoNL Nerd Font Propo",
		weight = "Regular",
		harfbuzz_features = { "calt=0", "clig=0", "liga=1" },
	},
	{ family = "Terminus", weight = "Bold" },
	"Noto Color Emoji",
})

if appearance == "Dark" then
	-- config.window_color_scheme = darkcolor_scheme -- Replace with your dark scheme name
	config.color_scheme = darkcolor_scheme -- Replace with your dark scheme name
	config.colors = {
		background = "#222222",
		cursor_bg = "#444444",
		cursor_fg = "white",
		split = pane_split_color,
		tab_bar = {
			background = "#2b2042",
			active_tab = { fg_color = "#ffffff", bg_color = "#52ADF8" },
			inactive_tab = { fg_color = "#aaaaaa", bg_color = "#2A587F" },
			inactive_tab_hover = { fg_color = "#ffffff", bg_color = "#52ADF8" },
			new_tab = { bg_color = "#54B948", fg_color = "#ffffff" },
			new_tab_hover = { bg_color = "#97FF82", fg_color = "#ffffff", italic = true },
		},
	}
else
	-- config.window_color_scheme = lightcolor_scheme -- Replace with your light scheme name
	config.color_scheme = lightcolor_scheme -- Replace with your light scheme name
	config.colors = {
		background = "#fefefe",
		cursor_bg = "#bababa",
		cursor_fg = "black",
		split = pane_split_color,
		tab_bar = {
			background = "#c8bee0",
			active_tab = { fg_color = "#ffffff", bg_color = "#0761ab" },
			inactive_tab = { fg_color = "#aaaaaa", bg_color = "#81aed5" },
			inactive_tab_hover = { fg_color = "#ffffff", bg_color = "#0761ab" },
			new_tab = { bg_color = "#52b946", fg_color = "#ffffff" },
			new_tab_hover = { bg_color = "#158000", fg_color = "#ffffff", italic = true },
		},
	}
end

config.keys = {
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
	{ key = "\\", mods = "SHIFT|SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "SHIFT|SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
}

config.line_height = 1.1
config.font_size = 12.0
config.initial_rows = 96
config.initial_cols = 256
config.default_cursor_style = "BlinkingBlock"
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.exit_behavior = "Close"
-- config.window_background_opacity = 0.96
-- config.macos_window_background_blur = 20

return config
