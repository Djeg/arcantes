require("nvchad.mappings")

-- Keymap by convention for consistency
local keymap = vim.keymap

-- unset nvchad keymaps
keymap.del("n", "<C-c>")

-- navigation
keymap.set("n", "<C-l>", "w", { desc = "Move to the next word" })
keymap.set("n", "<C-h>", "b", { desc = "Move to the previous word" })
keymap.set("n", "<C-j>", "4j", { desc = "Move up 4 characters" })
keymap.set("n", "<C-k>", "4k", { desc = "Move down 5 characters" })
keymap.set("v", "<C-l>", "w")
keymap.set("v", "<C-h>", "b")
keymap.set("v", "<C-j>", "4j")
keymap.set("v", "<C-k>", "4k")

-- Same bu for mac os using command
keymap.set("n", "<D-l>", "w")
keymap.set("n", "<D-h>", "b")
keymap.set("n", "<D-j>", "4j")
keymap.set("n", "<D-k>", "4k")
keymap.set("v", "<D-l>", "w")
keymap.set("v", "<D-h>", "b")
keymap.set("v", "<D-j>", "4j")
keymap.set("v", "<D-k>", "4k")

-- select all
keymap.set("n", "<leader>a", "gg<S-v><S-g><CR>")

-- buffer navigation
keymap.set("n", "<leader>q", ":bdelete<CR>")
keymap.set("n", "<leader>n", ":bNext<CR>")

-- clear search
keymap.set("n", "<leader>cs", ":nohlsearch<CR>")

-- source
keymap.set("n", "<leader>so", ":source ~/.config/nvim/init.lua<CR>")

-- Telescope
keymap.set("n", "<C-P>", ":Telescope find_files<CR>")
keymap.set("n", "<C-b>", ":Telescope buffers<CR>")

-- NVIM Tree
keymap.set("n", "<leader>nf", ":NvimTreeToggle<CR>")

-- Oil
keymap.set("n", "<C-a>", ":Oil --float<CR>")

-- LSP utils
keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show diagnostic" })
