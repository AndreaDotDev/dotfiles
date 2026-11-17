local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	"Berkeley Mono Trial",
	-- calt on: Commit Mono's "smart kerning" (no ligatures)
	-- { family = "CommitMono Nerd Font Mono", harfbuzz_features = { "calt=1", "clig=0", "liga=0" } },
	"JetBrainsMono Nerd Font Mono",
})
config.font_size = 15
config.line_height = 1.2
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.color_scheme = "MARDUK ALT"

-- ── Window ──────────────────────────────────────────────────────────────
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBlock"
config.initial_cols = 250
config.initial_rows = 50

-- Smoother rendering on Apple Silicon
config.front_end = "WebGpu"
config.max_fps = 120

config.keys = {
	{ key = "r", mods = "CMD|SHIFT", action = wezterm.action.ReloadConfiguration },
	{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\x1b\r") },
}

return config
