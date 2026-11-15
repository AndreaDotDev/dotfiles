-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- ── Font ────────────────────────────────────────────────────────────────
config.font = wezterm.font_with_fallback({
	"BlexMono Nerd Font Mono",
	"JetBrainsMono Nerd Font Mono",
})
config.font_size = 15
config.line_height = 1.2
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- ── Colors: Kanagawa Dragon ─────────────────────────────────────────────
-- From kanagawa.nvim extras/wezterm/kanagawa-dragon.lua; the same palette is
-- used by nvim, tmux, eza, bat, fzf and lazygit.
config.color_schemes = {
	["Kanagawa Dragon"] = {
		foreground = "#c5c9c5",
		background = "#181616",

		cursor_bg = "#c8c093",
		cursor_fg = "#c8c093",
		cursor_border = "#c8c093",

		selection_fg = "#c8c093",
		selection_bg = "#2d4f67",

		scrollbar_thumb = "#16161d",
		split = "#16161d",

		ansi = { "#0d0c0c", "#c4746e", "#8a9a7b", "#c4b28a", "#8ba4b0", "#a292a3", "#8ea4a2", "#c8c093" },
		brights = { "#a6a69c", "#e46876", "#87a987", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#c5c9c5" },
	},
}
config.color_scheme = "Kanagawa Dragon"
config.force_reverse_video_cursor = true -- cursor shows the text color under it

-- ── Window ──────────────────────────────────────────────────────────────
config.enable_tab_bar = false
config.window_background_opacity = 0.90
config.macos_window_background_blur = 30 -- frosted-glass effect behind the window
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBlock"
config.initial_cols = 250
config.initial_rows = 50

-- Smoother rendering on Apple Silicon
config.front_end = "WebGpu"
config.max_fps = 120

-- ── Keys ────────────────────────────────────────────────────────────────
config.keys = {
	{ key = "r", mods = "CMD|SHIFT", action = wezterm.action.ReloadConfiguration },
	{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\x1b\r") },
}

return config
