require("nvchad.configs.lspconfig").defaults()

-- List of servers to enable
local servers = { "html", "cssls", "lua_ls", "ts_ls", "eslint" }

-- Enable the servers
vim.lsp.enable(servers)
