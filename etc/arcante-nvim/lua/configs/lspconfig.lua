require("nvchad.configs.lspconfig").defaults()

-- List of servers to enable
local servers = { "html", "cssls", "lua_ls", "ts_ls", "eslint", "phpactor" }

-- Enable the servers
vim.lsp.enable(servers)

-- configure phpactor
vim.lsp.config.phpactor = {
	init_options = {
		["language_server_phpstan.enabled"] = true,
		["language_server_php_cs_fixer.enabled"] = true,
	},
}
