local file_utils = require("utils.files")

local function get_js_formatters()
	local formatters = {}

	if file_utils.has_file_in_cwd("biome.json") then
		table.insert(formatters, "biome")

		return formatters
	end

	if file_utils.has_file_in_cwd(".eslintrc.json") then
		table.insert(formatters, "eslint_d")
	end

	if file_utils.has_files_in_cwd({ ".prettierrc", ".prettierignore" }) then
		table.insert(formatters, "prettierd")
	end

	return formatters
end

local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = get_js_formatters,
		typescriptreact = get_js_formatters,
		javascript = get_js_formatters,
		php = { "php_cs_fixer", "pretty-php" },
	},
}

return options
