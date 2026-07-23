local M = {}

function M.execute_oracle_sql(opts)
	opts = opts or {}
	local host = os.getenv("VIM_ORACLE_SSH") or "user@default"
	local db = os.getenv("VIM_ORACLE_DB") or "user/pass@db"
	local remote_filename = os.getenv("VIM_ORACLE_DEST_FILENAME") or "log.sql"
	local filepath = opts.file or vim.fn.expand("%:p")
	local remote_host = opts.host or host or "user@serveur"
	local remote_file = opts.remote_dir or string.format("/tmp/%s", remote_filename)
	local db_conn = opts.db or db or "user/pass@db"

	-- 1. Upload via SFTP
	local upload_cmd = string.format('sftp %s <<< $\'put "%s" "%s"\'', remote_host, filepath, remote_file)

	local upload_result = vim.fn.system(upload_cmd)

	if vim.v.shell_error ~= 0 then
		vim.notify("SFTP upload failed: " .. upload_result, vim.log.levels.ERROR)
		return
	end

	-- 2. Exécuter via SSH sur le serveur distant
	local sql_cmd = string.format('sqlplus -s %s @%s <<< "QUIT"', db_conn, remote_file)
	local result = vim.fn.system({ "ssh", remote_host, sql_cmd })

	-- 3. Afficher le résultat dans un buffer Neovim
	M._open_result(result, "SQL Result")
	vim.notify("SQL exécuté", vim.log.levels.INFO)
end

function M._open_result(content, title)
	vim.api.nvim_command("vnew")
	vim.api.nvim_buf_set_name(0, title)
	vim.api.nvim_buf_set_option(0, "buftype", "nofile")
	vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
	vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(content, "\n"))
end

return M
