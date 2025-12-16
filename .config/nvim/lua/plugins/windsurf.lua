return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			enable_chat = true,
			virtual_text = {
				enabled = true,
				idle_delay = 25,
				key_bindings = {
					-- Accept the current completion.
					accept = "<C-l>",
					-- Cycle to the next completion.
					next = "<C-k>",
					-- Cycle to the previous completion.
					prev = "<C-j>",
				},
			},
		})
	end,
}
