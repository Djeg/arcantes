local opts = {}

opts.keymaps = {
	["<C-c>"] = false,
}

opts.win_options = {
	number = false,
}

opts.float = {
	max_width = 0.4,
	max_height = 0.6,
	win_options = {
		winblend = 30,
	},
	border = "rounded",
}

opts.preview_win = {
	disable_preview = function()
		return true
	end,
}

return opts
