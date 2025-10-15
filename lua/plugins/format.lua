return {
	"stevearc/conform.nvim",
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
	},
	config = function(_, opts)
		require("conform").setup(opts)
		require("conform").setup({
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting for all buffers
				vim.g.disable_autoformat = true
			else
				vim.b.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = false,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
