return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>",   group = "extended functionality" },
        { "<leader>w",  group = "windows",               proxy = "<c-w>" }, -- proxy to window mappings
        { "<leader>b",  group = "buffer navigation" },
        { "<leader>d",  group = "debugging" },
        { "<leader>f",  group = "find" },
        { "<leader>g",  group = "go to" },
        { "<leader>l",  group = "LSP actions" },
        { "<leader>ld", desc = "diagnostic" },
        { "<leader>n",  group = "note taking" },
        { "<leader>r",  group = "refactoring" },
        { "<leader>rE", group = "extract to file" },
        { "<leader>re", group = "extract" },
        { "<leader>ri", group = "inline" },
        { "<leader>t",  group = "testing" },
        { "<leader>e",  group = "execute code" },
      })
    end,
  },
}
