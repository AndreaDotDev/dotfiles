vim.lsp.config("jsonls", {
  cmd = { "json_lsp", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
})
