return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-mini/mini.icons" },
    opts = {},
    keys = {
      -- help
      { "<leader>?",  "<CMD>FzfLua keymaps<CR>",                                  desc = "Key Maps" },
      { "<leader>h",  "<CMD>FzfLua help_tags<CR>",                                desc = "Help Pages" },
      -- improved vim search
      { "<leader>/",  "<CMD>FzfLua grep_curbuf<CR>",                              desc = "Grep (Buffer)" },
      { "<leader>:",  "<CMD>FzfLua command<CR>",                                  desc = "Command" },
      { '<leader>"',  "<CMD>FzfLua registers<CR>",                                desc = "Registers" },
      -- find
      { "<leader>fa", "<CMD>FzfLua global<CR>",                                   desc = "All" },
      { "<leader>fb", "<CMD>FzfLua buffers sort_mru=true sort_lastused=true<CR>", desc = "Buffers" },
      { "<leader>ff", "<CMD>FzfLua files<CR>",                                    desc = "Find Files (Root Dir)" },
      { "<leader>fg", "<CMD>FzfLua git_files<CR>",                                desc = "Find Files (git-files)" },
      { "<leader>fr", "<CMD>FzfLua oldfiles<CR>",                                 desc = "Recent" },
      {
        "<leader>fs",
        function()
          require("fzf-lua").lsp_live_workspace_symbols({})
        end,
        desc = "Goto Symbol (Workspace)",
      },
      -- git
      { "<leader>ggc", "<CMD>FzfLua git_commits<CR>",           desc = "Commits" },
      { "<leader>ggs", "<CMD>FzfLua git_status<CR>",            desc = "Status" },
      -- Goto
      { "<leader>sc",  "<CMD>FzfLua command_history<CR>",       desc = "Command History" },
      { "<leader>gd",  "<CMD>FzfLua diagnostics_document<CR>",  desc = "Diagnostics (Document)" },
      { "<leader>gD",  "<CMD>FzfLua diagnostics_workspace<CR>", desc = "Diagnostics (Workspace)" },
      { "<leader>gj",  "<CMD>FzfLua jumps<CR>",                 desc = "Jumplist" },
      { "<leader>gl",  "<CMD>FzfLua loclist<CR>",               desc = "Location List" },
      { "<leader>gm",  "<CMD>FzfLua marks<CR>",                 desc = "Jump to Mark" },
      { "<leader>gq",  "<CMD>FzfLua quickfix<CR>",              desc = "Quickfix List" },
      {
        "<leader>gs",
        function()
          require("fzf-lua").lsp_document_symbols({})
        end,
        desc = "Goto Symbol (Document)",
      },
    },
  },
}
