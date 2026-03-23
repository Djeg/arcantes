require("nvchad.autocmds")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		vim.cmd(":Copilot")
	end,
})

-- Remove unused imports on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("ts_imports", { clear = true }),
	pattern = { "*.tsx,*.ts" },
	callback = function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.removeUnused.ts" },
				diagnostics = {},
			},
		})
	end,
})
