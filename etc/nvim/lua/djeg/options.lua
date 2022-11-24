local opt = vim.opt -- for consistency

-- encoding
opt.encoding = "utf-8"

-- line numbers
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- hide status line
opt.ls = 1
opt.ruler = true

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

-- improve backspace behaviour
opt.backspace = "indent,eol,start"

-- leader
vim.g.mapleader = ","

-- clipboard
opt.clipboard:append("unnamedplus")
