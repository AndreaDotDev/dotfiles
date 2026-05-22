-- servers/eslint.lua
vim.lsp.config("eslint", {
  cmd = { "eslint-lsp", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "eslint.config.js", "eslint.config.mjs", ".eslintrc.json", ".eslintrc.js", ".eslintrc" },
})
