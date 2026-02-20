require("nvchad.configs.lspconfig").defaults()

-- List of servers to enable
local servers = { "html", "cssls" }

-- Enable the servers
vim.lsp.enable(servers)
