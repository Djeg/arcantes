return {
	{
		"stevearc/conform.nvim",
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = function()
			return require("configs.telescope")
		end,
	},
	{
		"stevearc/oil.nvim",
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		opts = function()
			return require("configs.oil")
		end,
	},
}
