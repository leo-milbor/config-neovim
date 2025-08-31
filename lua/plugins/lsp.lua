local servers = {
  "lua_ls",        -- lua
  "bashls",        -- bash
  "gopls",         -- go
  "clojure_lsp",   -- clojure
  "rust_analyzer", -- rust
  "html",          -- html
  "jsonls",        -- json
  "dockerls",      -- dockerfile
  "pyright",       -- python
  "marksman",      -- markdown
  "taplo",         -- toml
  "yamlls",        -- yaml
  "dockerls",      -- dockerfile
  -- "fsautocomplete", -- F#
  -- "rnix-lsp",       -- Nix
}

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        config = function()
          vim.lsp.config("*", {
            capabilities = vim.lsp.protocol.make_client_capabilities()
          })
        end,
      },
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = servers,
      })
    end,
  },
}
