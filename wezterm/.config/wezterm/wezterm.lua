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

-- ── Colors: Black Metal — Marduk (alt) ──────────────────────────────────
-- Scheme file: colors/marduk-alt.toml (from black-metal-theme-neovim extras).
-- WezTerm loads every .toml in ~/.config/wezterm/colors automatically.
config.color_scheme = "MARDUK ALT"

-- ── Window ──────────────────────────────────────────────────────────────
config.enable_tab_bar = false
config.window_background_opacity = 0.95
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
