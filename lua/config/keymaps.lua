-- This has to be done before any mapping
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set_key = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- more sensible go top or bottom of file
set_key({ "n", "v" }, "gj", "G", { desc = "go to the bottom of the file" })
set_key({ "n", "v" }, "gk", "gg", { desc = "go to the top of the file" })

-- more sensible go beginning or en of the line
set_key({ "n", "v" }, "gl", "$", { desc = "go to the end of the line" })
set_key({ "n", "v" }, "gh", "^", { desc = "go to the beginning of the line" })

-- move stuff arround while in visual mode
set_key("v", "J", ":m '>+1<CR>gv=gv", { desc = "move visual selection down" })
set_key("v", "K", ":m '<-2<CR>gv=gv", { desc = "move visual selection up" })

-- buffer action
set_key("n", "<leader>bd", ":bd<CR>", { desc = "delete current buffer" })
set_key("n", "<leader>bn", ":bn<CR>", { desc = "go to next buffer" })
set_key("n", "<leader>bp", ":bp<CR>", { desc = "go to previous buffer" })
set_key("n", "<leader>bl", ":buffers<CR>", { desc = "show all buffers" })

-- keep cursor centered when searching
set_key("n", "J", "mzJ`z", { desc = "fuse next line with current line" })
set_key("n", "<C-d>", "<C-d>zz", { desc = "scroll half page down" })
set_key("n", "<C-u>", "<C-u>zz", { desc = "scroll half page up" })
set_key("n", "n", "nzzzv", { desc = "go to next search match" })
set_key("n", "N", "Nzzzv", { desc = "go to previous search match" })

-- greatest remap ever
set_key("x", "<leader>p", [["_dP]], { desc = "replace selected text without replacing register" })

-- next greatest remap ever : asbjornHaland
set_key({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to system clipboard" })

-- set_key({"n", "v"}, "<leader><leader>d", "\"_d", { desc = "delete to black hole register" })

set_key("n", "Q", "<nop>", { desc = "no ex, who wants that" })

-- set_key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "enter substitute command for word under cursor" })
