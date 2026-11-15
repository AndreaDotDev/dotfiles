-- Black Metal — Marduk (alt): near-black navy bg, crisp white, grays + one teal accent.
-- The same palette is used by WezTerm, tmux, eza, bat, fzf, lazygit and starship
-- (ports taken from the plugin's extras/ folder).
return {
	"metalelf0/black-metal-theme-neovim",
	lazy = false,
	priority = 1000,
	config = function()
		require("black-metal").setup({
			theme = "marduk",
			variant = "dark",
			alt_bg = true, -- the "alt" variant: #060b12 instead of pure black
			transparent = true, -- let WezTerm's opacity/blur show through
			plain_float = true, -- floats (Oil, hover, Telescope) use borders, no bg
			cursorline_gutter = false,
			code_style = {
				comments = "italic",
			},
		})
		require("black-metal").load()
	end,
}
