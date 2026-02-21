return {
	{
		"stevearc/conform.nvim",
		opts = function()
			return require("configs.conform")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			return require("configs.lspconfig")
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
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		opts = {
			extra_groups = {
				"NormalFloat",
				"NvimTreeNormal",
			},
		},
	},
	{
		"lionyxml/gitlineage.nvim",
		dependencies = {
			"sindrets/diffview.nvim", -- optional, for open_diff feature
		},
		config = function()
			require("gitlineage").setup()
		end,
	},
}
