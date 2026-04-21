return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"lewis6991/async.nvim",
		},
		lazy = false,
		config = function()
			local refactoring = (require("refactoring"))
			local set_key = vim.keymap.set
			local root_map = "<leader>r"

			set_key({ "n", "x" }, root_map .. "ef", function()
				return refactoring.extract_func()
			end, { desc = "extract function", expr = true })

			set_key({ "n", "x" }, root_map .. "Ef", function()
				return refactoring.extract_func_to_file()
			end, { desc = "extract function to file", expr = true })

			set_key({ "n", "x" }, root_map .. "ev", function()
				return refactoring.extract_var()
			end, { desc = "extract variable", expr = true })

			set_key({ "n", "x" }, root_map .. "if", function()
				return refactoring.inline_func()
			end, { desc = "inline function", expr = true })

			set_key({ "n", "x" }, root_map .. "iv", function()
				return refactoring.inline_var()
			end, { desc = "inline variable", expr = true })

			set_key({ "n", "v" }, root_map .. "a", function()
				refactoring.select_refactor()
			end, { desc = "show possible refactoring" })
		end,
	},
}
