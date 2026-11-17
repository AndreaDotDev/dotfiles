return {
	"metalelf0/black-metal-theme-neovim",
	lazy = false,
	priority = 1000,
	config = function()
		require("black-metal").setup({
			theme = "marduk",
			variant = "dark",
			alt_bg = true,
			transparent = true,
			plain_float = true,
			cursorline_gutter = false,
			code_style = {
				comments = "italic",
			},
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
			highlights = {
				["@lsp.type.readonly"] = { fmt = "none" },
				["@lsp.mod.readonly"] = { fmt = "none" },
			},
		})
		require("black-metal").load()
	end,
}
