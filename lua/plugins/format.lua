return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      json = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      markdown = { "prettierd" },
      yaml = { "prettierd" },
      toml = { "taplo" },
      sh = { "shfmt" },
      csharp = { "csharpier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
