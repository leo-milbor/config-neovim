return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      local refactor = require("refactoring").refactor
      local set_key = vim.keymap.set
      local root_map = "<leader>r"

      set_key("x", root_map .. "ef", function()
          return refactor("Extract Function") end,
        { desc = "extract function", expr = true })

      set_key("x", root_map .. "Ef", function()
          return refactor("Extract Function To File") end,
        { desc = "extract function to file", expr = true })

      set_key("x", root_map .. "ev", function()
          return refactor("Extract Variable") end,
        { desc = "extract variable", expr = true })

      set_key("n", root_map .. "if", function()
          return refactor("Inline Function") end,
        { desc = "inline function", expr = true })

      set_key({ "n", "x" }, root_map .. "iv", function()
          return refactor("Inline Variable") end,
        { desc = "inline variable", expr = true })

      set_key("n", root_map .. "eb", function()
          return refactor("Extract Block") end,
        { desc = "extract block", expr = true })

      set_key("n", root_map .. "Eb", function()
          return refactor("Extract Block To File") end,
        { desc = "extract block to file", expr = true })

      set_key("n", root_map .. "r",
        vim.lsp.buf.rename,
        { desc = "rename", noremap = true })

      set_key({ "n", "v" }, root_map .. "a", function()
          require("refactoring").select_refactor() end,
        { desc = "show possible refactoring" })

      set_key({ "n", "v" }, root_map .. "c",
        vim.lsp.buf.code_action,
        { desc = "code action", noremap = true }
      )

      -- prompting
      require("refactoring").setup({
        -- prompt for return type
        prompt_func_return_type = {
          go = true,
          cpp = true,
          c = true,
          java = true,
          h = true,
          hpp = true,
          cxx = true,
        },
        -- prompt for function parameters
        prompt_func_param_type = {
          go = true,
          cpp = true,
          c = true,
          java = true,
          h = true,
          hpp = true,
          cxx = true,
        },
      })
    end,
  },
}
