local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local doc_block_snippet = s({ trig = "db", desc = "Documentation block snippet" }, {
	t("/**"),
	t({ "", " * " }),
	i(0),
	t({ "", " */" }),
})

return {
	doc_block_snippet,
}
