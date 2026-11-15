-- Debugging: nvim-dap (engine) + nvim-dap-view (UI) + nvim-dap-python (Python adapter).
-- debugpy is installed with Mason (:MasonInstall debugpy); the program being
-- debugged runs with the project's .venv / $VIRTUAL_ENV automatically.
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "igorlfs/nvim-dap-view", version = "1.*", opts = { auto_toggle = true } }, -- opens/closes with the session
			"mfussenegger/nvim-dap-python",
		},
		keys = {
			{ "<F5>", function() require("dap").continue() end, desc = "Debug: start / continue" },
			{ "<F10>", function() require("dap").step_over() end, desc = "Debug: step over" },
			{ "<F11>", function() require("dap").step_into() end, desc = "Debug: step into" },
			{ "<F12>", function() require("dap").step_out() end, desc = "Debug: step out" },
			{ "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "Debug: toggle breakpoint" },
			{
				"<leader>bB",
				function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,
				desc = "Debug: conditional breakpoint",
			},
			{ "<leader>bc", function() require("dap").continue() end, desc = "Debug: start / continue" },
			{ "<leader>bo", function() require("dap").step_over() end, desc = "Debug: step over" },
			{ "<leader>bi", function() require("dap").step_into() end, desc = "Debug: step into" },
			{ "<leader>bu", function() require("dap").step_out() end, desc = "Debug: step out" },
			{ "<leader>bl", function() require("dap").run_last() end, desc = "Debug: run last" },
			{ "<leader>bq", function() require("dap").terminate() end, desc = "Debug: stop" },
			{ "<leader>bv", "<cmd>DapViewToggle<cr>", desc = "Debug: toggle UI" },
			{ "<leader>bw", "<cmd>DapViewWatch<cr>", mode = { "n", "v" }, desc = "Debug: watch expression" },
			-- Python: debug the test under the cursor (pytest / unittest / django)
			{ "<leader>bt", function() require("dap-python").test_method() end, ft = "python", desc = "Debug: test method" },
			{ "<leader>bT", function() require("dap-python").test_class() end, ft = "python", desc = "Debug: test class" },
		},
		config = function()
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
			vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" })

			local debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(debugpy)
			require("dap-python").test_runner = "pytest"
		end,
	},
}
