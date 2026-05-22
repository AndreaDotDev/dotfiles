return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "1.*",

  opts = {
    keymap = {
      preset = "default",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },
    },

    sources = {
      default = { "lsp", "path", "buffer" },
    },

    completion = {
      documentation = {
        auto_show = true,
      },
    },
  },
}
