return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{
				"neovim/nvim-lspconfig",
				dependencies = { "ibhagwan/fzf-lua" },
				config = function()
					local fzf = require("fzf-lua")
					vim.lsp.config("*", {
						capabilities = vim.lsp.protocol.make_client_capabilities(),
					})

					vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "definition" })
					vim.keymap.set("n", "gD", fzf.lsp_declarations, { desc = "declaration" })
					vim.keymap.set({ "n", "v" }, "grr", fzf.lsp_references, { desc = "references", noremap = true })
					vim.keymap.set(
						{ "n", "v" },
						"gri",
						fzf.lsp_implementations,
						{ desc = "code action", noremap = true }
					)
					vim.keymap.set({ "n", "v" }, "grc", fzf.lsp_code_actions, { desc = "code action", noremap = true })
					vim.keymap.set(
						{ "n", "v" },
						"gra",
						fzf.lsp_finder,
						{ desc = "fuzzy find lsp location", noremap = true }
					)
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
