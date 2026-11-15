-- Python language server: types, go-to-definition, hover, rename.
-- Linting/formatting/import sorting is left to ruff (see ruff.lua).
-- Installed with Mason (:MasonInstall basedpyright)

vim.lsp.config("basedpyright", {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"uv.lock",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		basedpyright = {
			disableOrganizeImports = true, -- ruff does it
			analysis = {
				typeCheckingMode = "standard", -- basedpyright's default ("recommended") is very strict
				autoImportCompletions = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
	-- Use the project's .venv (created by `uv sync` / `uv venv`) without having to
	-- activate it before opening nvim. An activated $VIRTUAL_ENV still wins.
	on_init = function(client)
		if vim.env.VIRTUAL_ENV then
			return
		end
		local root = client.root_dir
		local python = root and (root .. "/.venv/bin/python")
		if python and vim.uv.fs_stat(python) then
			client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
				python = { pythonPath = python },
			})
			client:notify("workspace/didChangeConfiguration", { settings = client.settings })
		end
	end,
})
