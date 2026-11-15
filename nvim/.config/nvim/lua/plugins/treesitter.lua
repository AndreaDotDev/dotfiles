-- Treesitter (nvim-treesitter `main` branch — the rewrite for Neovim 0.12+).
-- The engine is built into Neovim; this plugin only installs parsers + queries.
-- Requires: tree-sitter CLI (brew install tree-sitter-cli) and a C compiler.
local parsers = {
	-- Next.js / web
	"typescript",
	"tsx",
	"javascript",
	"jsdoc",
	"css",
	"scss",
	"html",
	"json",
	"prisma",
	-- Python
	"python",
	"toml",
	-- general
	"yaml",
	"bash",
	"dockerfile",
	"regex",
	"markdown",
	"markdown_inline",
	"diff",
	"gitcommit",
	"git_rebase",
	-- Neovim
	"lua",
	"vim",
	"vimdoc",
	"query",
}

-- Treesitter indentation is still experimental upstream: enable it only where it
-- beats the regex indent files (python keeps its builtin indent).
local ts_indent = {
	typescript = true,
	tsx = true,
	javascript = true,
	css = true,
	scss = true,
	html = true,
	json = true,
	lua = true,
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- does not support lazy-loading
		build = ":TSUpdate", -- keep parsers in sync with the plugin version
		config = function()
			-- no-op for parsers that are already installed; runs asynchronously
			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if not lang or not pcall(vim.treesitter.start, args.buf, lang) then
						return -- no parser for this filetype: keep regex highlighting
					end
					if ts_indent[lang] then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},

	-- Auto close and auto rename JSX/TSX/HTML tags
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			opts = {
				enable_close = true, -- <div> → <div></div>
				enable_rename = true, -- renaming <div> also renames </div>
				enable_close_on_slash = false,
			},
		},
	},
}
