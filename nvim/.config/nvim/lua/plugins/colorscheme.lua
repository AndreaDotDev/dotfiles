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
			-- Marduk's syntax grays are very dim (types #626b67, funcs #888888):
			-- lift them toward white while keeping the same brightness hierarchy.
			colors = {
				dark = {
					type = "#8f9a95", -- was #626b67
					func = "#c8c8c8", -- was #888888
					keyword = "#b4b4b4", -- was #999999
					constant = "#cccccc", -- was #aaaaaa
					number = "#cccccc", -- was #aaaaaa
					property = "#dcdcdc", -- was #c1c1c1
					string = "#c2c7c4", -- was #a5aaa7
					operator = "#b3b1ba", -- was #9b99a3
				},
			},
		})
		require("black-metal").load()
	end,
}
