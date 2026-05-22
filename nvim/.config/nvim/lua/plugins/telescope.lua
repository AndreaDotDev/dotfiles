return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")
      telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			keymaps = {
				vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in cwd" }),
				vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find string in cwd" }),
				vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" }),
				vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" }),
				--[[ vim.keymap.set(
					"n",
					"<leader>fl",
					builtin.treesitter,
					{ desc = "Lists Function names, variables, from Treesitter" }
				),
				vim.keymap.set(
					"n",
					"<leader>fd",
					builtin.lsp_definitions,
					{ desc = "Find Definition on string under cursor" }
				),]]
				vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Lists available help tags" }),
			},
		})
    end

}
