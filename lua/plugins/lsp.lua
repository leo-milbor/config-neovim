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
						capabilities = vim.lsp.protocol.make_client_capabilities(),
					})

					vim.keymap.set("n", "grf", vim.lsp.buf.format, { desc = "Format" })

					-- format on save
					vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
				end,
			},
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = {
					"bashls", -- bash
					"clojure_lsp", -- clojure
					"csharpier", -- C# formatter
					"dart-debug-adapter", -- dart debug
					"dockerls", -- dockerfile
					"expert", -- elixir
					"fsautocomplete", -- F#
					"gopls", -- go
					"html", -- html
					"hyprls", -- hprland
					"jsonls", -- json
					"lemminx", -- xml
					"lua_ls", -- lua
					"marksman", -- markdown
					"omnisharp", -- C#
					"prettierd", -- global formatter
					"pyright", -- python
					"rust_analyzer", -- rust
					"shfmt", -- shell formatter
					"stylua", -- lua formatter
					"taplo", -- toml
					"yamlls", -- yaml
				},
			})
		end,
	},
}
