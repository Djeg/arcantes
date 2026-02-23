local ls = require("luasnip")
local all = require("snippets.all")
local typescript = require("snippets.typescript")
local php = require("snippets.php")

ls.add_snippets("all", all)
ls.add_snippets("typescript", typescript)
ls.add_snippets("typescriptreact", typescript)
ls.add_snippets("php", php)
