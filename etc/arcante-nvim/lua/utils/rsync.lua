local M = {}

local config = {}

local function load_config()
	local conf_path = vim.fn.getcwd() .. "/.nvim/rsync.lua"
	local ok, result = pcall(dofile, conf_path)

	if not ok then
		vim.notify("[rsync] .nvim/rsync.lua introuvable", vim.log.levels.ERROR)
		return false
	end

	config = result

	return true
end

local function build_args(source, dest, extra)
	local args = { "rsync", "-avz", "--delete" }

	for _, ignore in ipairs(config.ignores or {}) do
		table.insert(args, "--exclude=" .. ignore)
	end

	if extra then
		vim.list_extend(args, extra)
	end

	local user_host = config.user .. "@" .. config.host

	table.insert(args, user_host .. ":" .. source)
	table.insert(args, dest)

	return args
end

function M.download()
	if not load_config() then
		return
	end

	local source = config.remote_path .. "/"
	local dest = vim.fn.getcwd() .. "/"
	local args = build_args(source, dest, { "--exclude=.nvim" })

	vim.fn.jobstart(args, {
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("[rsync] Pull terminé ✅", vim.log.levels.INFO)
			else
				vim.notify("[rsync] Pull échoué ❌", vim.log.levels.ERROR)
			end
		end,
	})
end

function M.upload_file()
	if not load_config() then
		return
	end

	local buf_path = vim.api.nvim_buf_get_name(0)

	if buf_path == "" then
		return
	end

	local cwd = vim.fn.getcwd() .. "/"
	local relative = vim.fn.fnamemodify(buf_path, ":.")

	if relative == buf_path then
		vim.notify(
			"[rsync] Le fichier n'est pas dans le projet : " .. cwd .. " || " .. buf_path .. " || " .. relative,
			vim.log.levels.WARN
		)
		return
	end

	local ssh = config.user .. "@" .. config.host
	local remote_dir = config.remote_path .. "/" .. vim.fn.fnamemodify(relative, ":h")

	vim.fn.system({ "ssh", ssh, "mkdir", "-p", remote_dir })

	local dest = config.user .. "@" .. config.host .. ":" .. config.remote_path .. "/" .. relative
	local args = { "rsync", "-avz", buf_path, dest }

	for _, ignore in ipairs(config.ignores or {}) do
		table.insert(args, "--exclude=" .. ignore)
	end

	vim.fn.jobstart(args, {
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("[rsync] " .. relative .. " uploadé ✅", vim.log.levels.INFO)
			else
				vim.notify("[rsync] Upload échoué ❌", vim.log.levels.ERROR)
			end
		end,
	})
end

function M.upload_all()
	if not load_config() then
		return
	end

	local source = vim.fn.getcwd() .. "/"
	local dest = config.user .. "@" .. config.host .. ":" .. config.remote_path .. "/"
	local args = { "rsync", "-avz", "--delete", source, dest }

	for _, ignore in ipairs(config.ignores or {}) do
		table.insert(args, "--exclude=" .. ignore)
	end

	vim.fn.jobstart(args, {
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("[rsync] Push all terminé ✅", vim.log.levels.INFO)
			else
				vim.notify("[rsync] Push all échoué ❌", vim.log.levels.ERROR)
			end
		end,
	})
end

function M.init()
	local dir = vim.fn.getcwd() .. "/.nvim"
	local file = dir .. "/rsync.lua"

	if vim.fn.isdirectory(dir) == 1 and vim.fn.filereadable(file) == 1 then
		vim.notify("[rsync] .nvim/rsync.lua existe déjà", vim.log.levels.INFO)
		return
	end

	vim.fn.mkdir(dir, "p")

	local template = [[return {
  host = 'host',
  user = 'user',
  remote_path = '/home/user',
  ignores = { '.git', 'node_modules', '.env', 'tmp' },
}
]]

	vim.fn.writefile(vim.split(template, "\n"), file)

	vim.notify("[rsync] .nvim/rsync.lua créé ✨", vim.log.levels.INFO)
end

return M
