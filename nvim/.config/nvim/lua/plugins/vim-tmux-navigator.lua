-- Ctrl + h/j/k/l moves between nvim splits AND tmux panes with the same keys.
-- The tmux side is configured in tmux/.tmux.conf (christoomey/vim-tmux-navigator).
return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	init = function()
		vim.g.tmux_navigator_no_wrap = 1 -- don't wrap around at the edges
	end,
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Window/pane left" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window/pane down" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window/pane up" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window/pane right" },
	},
}
