local keymap = vim.keymap -- for consistency

-- navigation
keymap.set("n", "<C-l>", "w")
keymap.set("n", "<C-h>", "b")
keymap.set("n", "<C-j>", "4j")
keymap.set("n", "<C-k>", "4k")
keymap.set("v", "<C-l>", "w")
keymap.set("v", "<C-h>", "b")
keymap.set("v", "<C-j>", "4j")
keymap.set("v", "<C-k>", "4k")

-- select all
keymap.set("n", "<leader>a", "gg<S-v><S-g><CR>")

-- buffer navigation
keymap.set("n", "<leader>q", ":bdelete<CR>")

-- clear search
keymap.set("n", "<leader>/", ':let @/=""<CR>')

-- source
keymap.set("n", "<leader>ss", ":source ~/.config/nvim/init.lua<CR>")
