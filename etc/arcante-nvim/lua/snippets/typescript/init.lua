local table_utils = require("utils.tables")
local docSnips = require("snippets.typescript.typescript_tsdoc")
local fnSnips = require("snippets.typescript.typescript_fn")
local typesSnips = require("snippets.typescript.typescript_types")
local jestSnips = require("snippets.typescript.typescript_jest")
local reactSnips = require("snippets.typescript.typescript_react")

local M = table_utils.merge(docSnips, fnSnips, typesSnips, jestSnips, reactSnips)

return M
