local ai_repo_path = vim.fn.expand("~/sources/cerebrum-machinae/")
local function get_agent_prompt(module_name)
	local prompt_parts = {}

	local structure = {
		{ dir = "core", file = "persona.md" },
		{ dir = "core", file = "rules.md" },
		{ dir = "core", file = "workflow.md" },
		{ dir = "modules/" .. module_name, file = "persona.md" },
		{ dir = "modules/" .. module_name, file = "rules.md" },
		{ dir = "modules/" .. module_name, file = "workflow.md" },
	}

	for _, item in ipairs(structure) do
		local filepath = string.format("%s/%s/%s", ai_repo_path, item.dir, item.file)
		local f = io.open(filepath, "r")

		if f then
			local content = f:read("*all")
			f:close()
			-- Add a visual separator for the LLM to understand context switching
			table.insert(prompt_parts, string.format("\n\n### Context: %s/%s\n%s", item.dir, item.file, content))
		else
			vim.notify("AI Agent: Could not load " .. filepath, vim.log.levels.WARN)
		end
	end

	if #prompt_parts == 0 then
		return "Error: No prompt files found. Please check your path configuration."
	end

	return table.concat(prompt_parts, "\n")
end

return {
	-- {
	--   "folke/sidekick.nvim",
	--   opts = {
	--     -- add any options here
	--     cli = {
	--       mux = {
	--         backend = "tmux",
	--         enabled = true,
	--       },
	--     },
	--   },
	--   keys = {
	--     {
	--       "<tab>",
	--       function()
	--         -- if there is a next edit, jump to it, otherwise apply it if any
	--         if not require("sidekick").nes_jump_or_apply() then
	--           return "<Tab>" -- fallback to normal tab
	--         end
	--       end,
	--       expr = true,
	--       desc = "Goto/Apply Next Edit Suggestion",
	--     },
	--     {
	--       "<c-.>",
	--       function()
	--         require("sidekick.cli").toggle()
	--       end,
	--       desc = "Sidekick Toggle",
	--       mode = { "n", "t", "i", "x" },
	--     },
	--     {
	--       "<leader>aa",
	--       function()
	--         require("sidekick.cli").toggle()
	--       end,
	--       desc = "Sidekick Toggle CLI",
	--     },
	--     {
	--       "<leader>as",
	--       function()
	--         require("sidekick.cli").select()
	--       end,
	--       -- Or to select only installed tools:
	--       -- require("sidekick.cli").select({ filter = { installed = true } })
	--       desc = "Select CLI",
	--     },
	--     {
	--       "<leader>ad",
	--       function()
	--         require("sidekick.cli").close()
	--       end,
	--       desc = "Detach a CLI Session",
	--     },
	--     {
	--       "<leader>at",
	--       function()
	--         require("sidekick.cli").send({ msg = "{this}" })
	--       end,
	--       mode = { "x", "n" },
	--       desc = "Send This",
	--     },
	--     {
	--       "<leader>af",
	--       function()
	--         require("sidekick.cli").send({ msg = "{file}" })
	--       end,
	--       desc = "Send File",
	--     },
	--     {
	--       "<leader>av",
	--       function()
	--         require("sidekick.cli").send({ msg = "{selection}" })
	--       end,
	--       mode = { "x" },
	--       desc = "Send Visual Selection",
	--     },
	--     {
	--       "<leader>ap",
	--       function()
	--         require("sidekick.cli").prompt()
	--       end,
	--       mode = { "n", "x" },
	--       desc = "Sidekick Select Prompt",
	--     },
	--   },
	-- },
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.keymap.set(
				{ "n", "v" },
				"<leader>aa",
				"<cmd>CodeCompanionActions<cr>",
				{ desc = "AI actions", noremap = true, silent = true }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ac",
				"<cmd>CodeCompanionChat<cr>",
				{ desc = "AI chat", noremap = true, silent = true }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ai",
				"<cmd>CodeCompanion<cr>",
				{ desc = "Inline AI edit", noremap = true, silent = true }
			)
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "gemini",
						slash_commands = {

							["pair"] = {
								description = "Load Pair Programmer",
								prompts = {
									{
										role = "system",
										content = function()
											return get_agent_prompt("pair_programmer")
										end,
									},
									{
										role = "user",
										content = "The pair programmer agent is active. Ready for instructions.",
										opts = { auto_submit = false },
									},
								},
							},
						},
					},
					inline = {
						adapter = "gemini",
					},
					cmd = {
						adapter = "gemini",
					},
					background = {
						adapter = "gemini",
					},
				},
			})
		end,
	},
}
