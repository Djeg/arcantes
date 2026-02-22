local table_utils = require("utils.tables")
local docSnips = require("snippets.typescript.typescript_tsdoc")
local fnSnips = require("snippets.typescript.typescript_fn")

local M = table_utils.merge(docSnips, fnSnips)

return M
