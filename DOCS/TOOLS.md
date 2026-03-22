# External Tools Required / Recommended

This file lists external binaries that are referenced by the configuration.
To install preferably either with `mise` or `Mason`

- `stylua`
- `goimports`
- `gofumpt`
- `prettierd`
- `black`
- `csharpier`
- `shfmt`
- `taplo`

Notes

- The configuration uses `conform.nvim` for formatting.
    - Ensure the formatters you want to use are available on PATH
    - Or installed via mason (or mason-tool-installer / mason-null-ls if you add those plugins).
- Some language server / tool names also appear in the LSP setup.
    - Verify which are language servers (managed by mason-lspconfig)
    - Standalone formatters/linters (managed by mason or system packages) and install them with the appropriate tool.
