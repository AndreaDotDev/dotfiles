local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.keymaps")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	rocks = {
		enabled = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

require("config.lsp")

-- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 1. Enable auto-write, auto-read, and persistent undo history
vim.opt.autowriteall = true
vim.opt.autoread = true
vim.opt.undofile = true -- Keeps undo history even if you close the file!

-- 2. Automatically SAVE when you switch away to Claude Code
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" then
			vim.cmd("silent! wall")
		end
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = "*",
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd("silent! checktime")
		end
	end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
	pattern = "*",
	callback = function()
		vim.notify(
			"🤖 Claude Code updated this file seamlessly! (Press 'u' to undo if needed)",
			vim.log.levels.INFO,
			{ title = "Claude Sync" }
		)
	end,
})
