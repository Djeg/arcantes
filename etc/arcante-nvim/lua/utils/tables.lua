local M = {}

--- Merges any number of tables into a new table.
--- Later tables take precedence for duplicate keys.
---@param ... table
---@return table
function M.merge(...)
	local result = {}

	for _, t in ipairs({ ... }) do
		for k, v in pairs(t) do
			result[k] = v
		end
	end

	return result
end

return M
