local file_utils = {}

function file_utils.file_exists(file)
	local f = io.open(file, "r")

	if f then
		f.close(f)

		return true
	else
		return false
	end
end

function file_utils.has_file_in_cwd(file)
	local cwd = vim.fn.getcwd()

	return file_utils.file_exists(cwd .. "/" .. file)
end

function file_utils.has_files_in_cwd(files)
	for _, file in ipairs(files) do
		if file_utils.has_file_in_cwd(file) then
			return true
		end
	end

	return false
end

return file_utils
