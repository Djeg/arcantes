require("nvchad.configs.lspconfig").defaults()

-- List of servers to enable
local servers = { "html", "cssls", "biome", "lua_ls", "ts_ls", "eslint", "phpactor", "vue_ls" }
local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vtsls_config = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = tsserver_filetypes,
}
local ts_ls_config = {
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	filetypes = tsserver_filetypes,
}
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", {})
vim.lsp.config("ts_ls", ts_ls_config)

-- Enable the servers
vim.lsp.enable(servers)

-- configure phpactor
vim.lsp.config.phpactor = {
	init_options = {
		["language_server_phpstan.enabled"] = true,
		["language_server_php_cs_fixer.enabled"] = true,
	},
}
