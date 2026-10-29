return {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
	build = false,
	config = function()
		-- Make the background transparent so the WezTerm opacity/blur shows through
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				local groups = {
					"Normal",
					"NormalNC",
					"NormalFloat",
					"FloatBorder",
					"SignColumn",
					"LineNr",
					"CursorLineNr",
					"FoldColumn",
					"EndOfBuffer",
					"StatusLine",
					"StatusLineNC",
					"WinSeparator",
					"TelescopeNormal",
					"TelescopeBorder",
					"NeoTreeNormal",
					"NeoTreeNormalNC",
					"NvimTreeNormal",
				}
				for _, group in ipairs(groups) do
					vim.api.nvim_set_hl(0, group, { bg = "none" })
				end
			end,
		})

		vim.opt.background = "dark" -- Oxocarbon has dark and light versions; this picks dark
		vim.cmd("colorscheme oxocarbon")
	end,
}
