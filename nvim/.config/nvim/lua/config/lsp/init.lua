-- Load single server configs
require("config.lsp.servers.lua_ls")
require("config.lsp.servers.ts_ls")
require("config.lsp.servers.css_ls")
require("config.lsp.servers.tailwindcss_ls")
require("config.lsp.servers.json_ls")
require("config.lsp.servers.eslint_ls")
require("config.lsp.servers.basedpyright")
require("config.lsp.servers.ruff")

-- Enable all servers
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"css_ls",
	"tailwindcss_ls",
	"json_ls",
	"eslint_ls",
	"basedpyright",
	"ruff",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local buf = event.buf
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
		end

		-- Telescope
		map("n", "gR", function()
			require("telescope.builtin").lsp_references()
		end, "Show LSP references")
		map("n", "gd", function()
			require("telescope.builtin").lsp_definitions()
		end, "Show LSP definitions")
		map("n", "gi", function()
			require("telescope.builtin").lsp_implementations()
		end, "Show LSP implementations")
		map("n", "gt", function()
			require("telescope.builtin").lsp_type_definitions()
		end, "Show LSP type definitions")
		map("n", "<leader>D", function()
			require("telescope.builtin").diagnostics({ bufnr = 0 })
		end, "Show buffer diagnostics")

		-- Native
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		map("n", "K", vim.lsp.buf.hover, "Show documentation under cursor")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")
		map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
		map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
		map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

		-- Utility
		map("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP")
	end,
})

-- Aspect of diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
