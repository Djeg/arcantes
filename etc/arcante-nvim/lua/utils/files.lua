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

function file_utils.extract_filename(path)
	local token = string.match(path, "([^/]+)%.[a-zA-Z0-9]+$")

	if not token then
		return ""
	end

	return token
end

function file_utils.get_pascal_cased_filename(path)
	local filename = file_utils.extract_filename(path)

	if filename == "" then
		return ""
	end

	-- Insert _ before uppercase letters to normalize camelCase
	local normalized = filename:gsub("([A-Z])", "_%1"):gsub("^_", "")

	local parts = {}
	for part in normalized:gmatch("[^%-_]+") do
		table.insert(parts, part:sub(1, 1):upper() .. part:sub(2):lower())
	end

	return table.concat(parts, "")
end

return file_utils
