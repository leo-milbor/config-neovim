vim.keymap.set("n", "<leader>ie", function()
	vim.diagnostic.open_float()
end, { noremap = true, silent = true, desc = "Show line diagnostics" })

return {}
