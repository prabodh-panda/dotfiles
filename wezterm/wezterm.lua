-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- maximize all displayed windows on startup
wezterm.on("gui-attached", function(domain)
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

config.native_macos_fullscreen_mode = false

-- For transparency
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

-- For example, changing the color scheme:
config.color_scheme = "ayu"

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#0f1419",
	},
	-- Search match colors (ayu theme)
	quick_select_label_bg = { Color = "#ffcc66" }, -- Ayu accent yellow (active match)
	quick_select_label_fg = { Color = "#0f1419" }, -- Dark text for contrast
	quick_select_match_bg = { Color = "#36a3d9" }, -- Ayu blue (inactive matches)
	quick_select_match_fg = { Color = "#0f1419" }, -- Dark text for contrast
}

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font = wezterm.font_with_fallback({
	-- Primary font
	{ family = "IosevkaTerm Nerd Font Mono", weight = "DemiBold" },
	-- { family = "Maple Mono NF", weight = "Medium" },
	-- Explicit fallbacks
	"Symbols Nerd Font",
	"Font Awesome 6 Free", -- For Font Awesome icons
	"Noto Color Emoji", -- For emoji support
	"Apple Color Emoji", -- macOS system emoji fallback
})

config.font_size = 17.0

config.keys = {
	-- This will create a new split towards right and run your default program inside it
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "f",
		mods = "CMD|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "t",
		mods = "CMD|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local overrides = window:get_config_overrides() or {}
			if overrides.enable_tab_bar == nil then
				overrides.enable_tab_bar = false
			else
				overrides.enable_tab_bar = not overrides.enable_tab_bar
			end
			window:set_config_overrides(overrides)
		end),
	},
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },

	-- Add explicit shortcuts for closing pane and tab
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "w",
		mods = "CMD|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	-- Move tab left
	{
		key = "h",
		mods = "CMD|SHIFT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	-- Move tab right
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = wezterm.action.MoveTabRelative(1),
	},
	-- Navigate between panes
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	-- Move/swap panes (vim style)
	{
		key = "h",
		mods = "CMD|CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CMD|CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD|CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CMD|CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	-- Rotate panes
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	{
		key = "r",
		mods = "CMD|CTRL",
		action = wezterm.action.RotatePanes("CounterClockwise"),
	},
	-- Enter pane selection mode (then use arrow keys to swap)
	{
		key = "p",
		mods = "CMD|SHIFT",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	{
		key = "0",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivateTab(9), -- 0-indexed
	},
	{
		key = "r",
		mods = "CTRL|ALT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new tab name",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.window_decorations = "RESIZE"

config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	-- font = wezterm.font({ family = "Hack Nerd Font Mono", weight = "Bold" }),
	font = wezterm.font({ family = "Iosevka Nerd Font Mono", weight = "Regular" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 10.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#0f1419",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#0f1419",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#0f1419",
	},
}

function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.3,
}

-- Set the tab title to currently running foreground process name
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local tab_title = tab.tab_title
	local title
	if tab_title and #tab_title > 0 then
		title = tab_title .. " " .. (tab.tab_index + 1)
	else
		local cwd = pane.current_working_dir
		local folder_name = ""
		if cwd then
			-- Extract folder name from the current working directory
			folder_name = cwd.file_path:match("([^/]+)/?$") or ""
		end
		local service = basename(pane.foreground_process_name)
		title = folder_name .. " " .. service .. " " .. (tab.tab_index + 1)
	end
	local color = "#0f1419"
	if tab.is_active then
		color = "darkblue"
	end
	return {
		{ Background = { Color = color } },
		{ Text = " " .. title .. " " },
	}
end)

-- and finally, return the configuration to wezterm
return config
