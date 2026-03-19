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
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "definition" })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "declaration" })
				end,
			},
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = {
					-- lua
					"lua_ls",
					"stylua", -- lua formatter

					-- go
					"gopls",

					-- web
					"html", -- html
					"emmet_ls", -- html/jsx
					"vtsls", -- typescript/react
					"tailwindcss", -- css

					-- shell
					"bashls", -- bash

					-- note
					"marksman", -- markdown

					-- code
					"clojure_lsp", -- clojure
					"expert", -- elixir
					"fsautocomplete", -- F#
					"omnisharp", -- C#
					"pyright", -- python
					"rust_analyzer", -- rust

					-- data/conf
					"dockerls", -- dockerfile
					"hyprls", -- hprland
					"lemminx", -- xml
					"jsonls", -- json
					"taplo", -- toml
					"yamlls", -- yaml
				},
			})
		end,
	},
}
