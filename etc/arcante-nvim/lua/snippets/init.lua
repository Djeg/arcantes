local ls = require("luasnip")
local all = require("snippets.all")
local typescript = require("snippets.typescript")

ls.add_snippets("all", all)
ls.add_snippets("typescript", typescript)
ls.add_snippets("typescriptreact", typescript)
