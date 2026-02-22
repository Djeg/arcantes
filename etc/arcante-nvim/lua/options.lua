require("nvchad.options")

-- Options by convention for consistency
local opt = vim.opt

-- mouse
opt.mouse = "a"

-- encoding
opt.encoding = "utf-8"

-- line numbers
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = false

-- hide status line
-- opt.ls =
-- opt.ruler = true

-- list hidden chars
opt.list = true
opt.listchars["trail"] = "∙"
opt.listchars["tab"] = "▹∙"
opt.listchars["nbsp"] = "ⅹ"

-- line wrapping
opt.wrap = false

-- seatch settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- cursor line
opt.cursorline = true

-- appearence
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "80,120"
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- improve backspace behaviour
opt.backspace = "indent,eol,start"

-- leader
vim.g.mapleader = ","
opt.timeoutlen = 150

-- clipboard
opt.clipboard = "unnamedplus"

-- transparent
vim.g.transparent_enabled = true

-- Lua Snippet path
vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"
