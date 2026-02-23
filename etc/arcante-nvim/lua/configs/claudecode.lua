local opts = {}

opts.terminal = {
	snacks_win_opts = {
		width = 0.5,
		height = 0.9,
		border = "rounded",
		backdrop = 80,
		keys = {
			claude_hide = {
				"<leader>ct",
				function(self)
					self:hide()
				end,
				mode = "t",
				desc = "Hide",
			},
		},
	},
}

return opts
