return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")

		oil.setup({
			view_options = {
				show_hidden = true, -- show files and directories that starts with "."
			},
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			keymaps = {
				["q"] = "actions.close",
			},
			float = {
				padding = 2,
				max_width = 0.8, -- 80% of the screen width
				max_height = 0.8, -- 80% of the screen height
				border = "rounded",
			},
		})
	end,
}
