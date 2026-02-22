local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local doc_block_snip = s({ trig = "db", desc = "TSDoc snippet" }, {
	t({ "/**", " * " }),
	i(1),
	t({ "", " */" }),
})

return {
	doc_block_snip,
}
