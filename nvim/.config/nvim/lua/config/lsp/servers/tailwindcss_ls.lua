-- Tailwind CSS language server
vim.lsp.config("tailwindcss", {
  cmd = { "tailwind-css-language-server", "--stdio" },
  filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
  root_markers = { "tailwind.config.js", "tailwind.config.ts", "tailwind.config.mjs" },
})
