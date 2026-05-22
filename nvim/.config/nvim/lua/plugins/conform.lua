return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = false, lsp_fallback = true })
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },

  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      markdown = { "prettierd" },
    },

    -- format automatico al salvataggio
    format_on_save = {
      timeout_ms = 2000,
      lsp_fallback = true,
    },
  },
}
