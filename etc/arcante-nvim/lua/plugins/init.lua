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
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "twig", "html" } },
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
	{
		"tpope/vim-dadbod",
		cmd = "DB",
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = "vim-dadbod",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local cmp = require("cmp")

					-- global sources
					local sources = vim.tbl_map(function(source)
						return { name = source.name }
					end, cmp.get_config().sources)

					-- add vim-dadbod-completion source
					table.insert(sources, { name = "vim-dadbod-completion" })

					-- update sources for the current buffer
					cmp.setup.buffer({ sources = sources })
				end,
			})
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		dependencies = "vim-dadbod",
		keys = {
			{ "<leader>DB", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
		},
		init = function()
			local data_path = vim.fn.stdpath("data")

			vim.g.db_ui_auto_execute_table_helpers = 1
			vim.g.db_ui_save_location = data_path .. "/dadbod_ui"
			vim.g.db_ui_show_database_icon = true
			vim.g.db_ui_tmp_query_location = data_path .. "/dadbod_ui/tmp"
			vim.g.db_ui_use_nerd_fonts = true
			vim.g.db_ui_use_nvim_notify = true

			-- NOTE: The default behavior of auto-execution of queries on save is disabled
			-- this is useful when you have a big query that you don't want to run every time
			-- you save the file running those queries can crash neovim to run use the
			-- default keymap: <leader>S
			vim.g.db_ui_execute_on_save = false
		end,
	},
	{
		"junegunn/vim-easy-align",
		cmd = { "EasyAlign" },
	},
	{
		"coffebar/transfer.nvim",
		lazy = true,
		cmd = {
			"TransferInit",
			"DiffRemote",
			"TransferUpload",
			"TransferDownload",
			"TransferDirDiff",
			"TransferRepeat",
		},
		opts = {},
	},
	{
		"nickjvandyke/opencode.nvim",
		version = "*", -- Latest stable release
		opts = {},
		config = function()
			local opts = {}

			return opts
		end,
	},
}
