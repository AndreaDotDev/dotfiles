-- Tailwind CSS language server
vim.lsp.config("tailwindcss_ls", {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.ts",
		"tailwind.config.mjs",
		"tailwind.config.cjs",
		"postcss.config.js",
		"package.json",
	},
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "ngClass", "style" },
			classFunctions = { "tw", "clsx", "cva" },
		},
	},
})
