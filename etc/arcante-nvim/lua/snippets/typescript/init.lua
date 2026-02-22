local table_utils = require("utils.tables")
local docSnips = require("snippets.typescript.typescript_tsdoc")
local fnSnips = require("snippets.typescript.typescript_fn")
local typesSnips = require("snippets.typescript.typescript_types")
local jestSnips = require("snippets.typescript.typescript_jest")

local M = table_utils.merge(docSnips, fnSnips, typesSnips, jestSnips)

return M
