# External tools required / recommended

This file lists external binaries that are referenced by the configuration. Install them either via your system package manager, `npm`/`pnpm` where applicable, or manage them with `mason.nvim` / a mason tool installer plugin.

Observed tools (from lua/plugins/format.lua and lua/plugins/lsp.lua):

- stylua
- goimports
- gofumpt
- prettierd
- black
- csharpier
- shfmt
- taplo

Notes

- The configuration uses `conform.nvim` for formatting. Ensure the formatters you want to use are available on PATH or installed via mason (or mason-tool-installer / mason-null-ls if you add those plugins).
- Some language server / tool names also appear in the LSP setup. Verify which are language servers (managed by mason-lspconfig) vs standalone formatters/linters (managed by mason or system packages) and install them with the appropriate tool.
