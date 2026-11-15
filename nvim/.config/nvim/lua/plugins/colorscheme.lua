-- Kanagawa Dragon: the same palette is used by WezTerm, tmux, eza, bat, fzf and lazygit.
return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		theme = "dragon",
		background = { dark = "dragon", light = "lotus" },
		transparent = true, -- let WezTerm's opacity/blur show through
		colors = {
			theme = {
				all = {
					ui = { bg_gutter = "none" }, -- no separate background for the sign/number column
				},
			},
		},
		overrides = function(colors)
			local theme = colors.theme
			return {
				-- transparent floats (Oil, LSP hover, diagnostics) to match the editor
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },

				-- Telescope: borderless-looking, transparent
				TelescopeNormal = { bg = "none" },
				TelescopeBorder = { fg = theme.ui.bg_p2, bg = "none" },
				TelescopeTitle = { fg = theme.ui.special, bold = true },

				-- completion menu (blink.cmp)
				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
				PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },
			}
		end,
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd.colorscheme("kanagawa-dragon")
	end,
}
