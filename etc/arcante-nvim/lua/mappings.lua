require("nvchad.mappings")

local ls = require("luasnip")

-- Keymap by convention for consistency
local keymap = vim.keymap
local rsync = require("utils.rsync")

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
keymap.set("n", "<leader>q", "::b#<bar>bd#<CR>")
keymap.set("n", "<leader>n", ":bNext<CR>")

-- clear search
keymap.set("n", "<leader>cs", ":nohlsearch<CR>")

-- Copy current file path to clipboard
keymap.set(
	{ "n", "v" },
	"<leader>cp",
	":lua require('utils.files').copy_file_path_to_clipboard()<CR>",
	{ desc = "Copy file path to clipboard" }
)

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
keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic" })
keymap.set("n", "<leader>df", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show function signature" })

-- LuaSnip
keymap.set("i", "<leader><tab>", function()
	ls.jump(1)
end, { desc = "next snippet", silent = true })

-- Prompting UTILS
-- keymap.set("n", "<leader>op", ":e PROMPT.md<CR>")

-- TYpescript fix all
keymap.set("n", "<leader>tsf", ":lua require('typescript').actions.fixAll()<cr>")

-- Opencode keymap
vim.keymap.set({ "n", "x", "v" }, "<leader>oa", function()
	require("opencode").ask("@this: ")
end, { desc = "Ask OpenCode…" })
vim.keymap.set({ "n", "x", "v" }, "<leader>os", function()
	require("opencode").select()
end, { desc = "Select OpenCode…" })

-- Oracle helpers
keymap.set("n", "<leader>orc", function()
	require("utils.execute_oracle_sql").execute_oracle_sql()
end, { desc = "Compile the current sql file in oracle db" })

-- Rsync commands and keypmaps
vim.api.nvim_create_user_command("RsyncDL", rsync.download, {})
vim.api.nvim_create_user_command("RsyncUp", rsync.upload_file, {})
vim.api.nvim_create_user_command("RsyncUpAll", rsync.upload_all, {})
vim.api.nvim_create_user_command("RsyncInit", rsync.init, {})

vim.keymap.set("n", "<leader>rsd", "<cmd>RsyncDL<CR>", { desc = "Rsync pull (server → local)" })
vim.keymap.set("n", "<leader>rsu", "<cmd>RsyncUp<CR>", { desc = "Rsync upload fichier courant" })
vim.keymap.set("n", "<leader>rsa", "<cmd>RsyncUpAll<CR>", { desc = "Rsync push tout le projet" })
vim.keymap.set("n", "<leader>rsi", "<cmd>RsyncInit<CR>", { desc = "Rsync créer .nvim/rsync.lua" })

-- vim.keymap.set({ "n", "x" }, "go", function()
-- 	return require("opencode").operator("@this ")
-- end, { desc = "Append range to OpenCode", expr = true })
-- vim.keymap.set("n", "goo", function()
-- 	return require("opencode").operator("@this ") .. "_"
-- end, { desc = "Append line to OpenCode", expr = true })
--
-- vim.keymap.set("n", "<S-C-u>", function()
-- 	require("opencode").command("session.half.page.up")
-- end, { desc = "Scroll OpenCode up" })
-- vim.keymap.set("n", "<S-C-d>", function()
-- 	require("opencode").command("session.half.page.down")
-- end, { desc = "Scroll OpenCode down" })
