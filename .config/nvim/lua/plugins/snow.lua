return {
	"marcussimonsen/let-it-snow.nvim",
	cmd = "LetItSnow", -- Wait with loading until command is run
	config = function()
		require("let-it-snow").setup({
			delay = 300,
		})
	end,
}
