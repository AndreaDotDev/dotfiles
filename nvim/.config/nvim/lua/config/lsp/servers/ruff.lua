-- Python linter + formatter (ruff's built-in language server).
-- Installed with Mason (:MasonInstall ruff)
-- Rules come from the project's pyproject.toml / ruff.toml, or ~/.config/ruff/ruff.toml.

vim.lsp.config("ruff", {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", "uv.lock", ".git" },
	on_attach = function(client)
		-- basedpyright gives richer hover info (types + docs)
		client.server_capabilities.hoverProvider = false
	end,
})
