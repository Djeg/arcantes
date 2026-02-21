require("nvchad.configs.lspconfig").defaults()

-- List of servers to enable
local servers = { "html", "cssls", "lua_ls", "ts_ls" }

-- Enable the servers
vim.lsp.enable(servers)
