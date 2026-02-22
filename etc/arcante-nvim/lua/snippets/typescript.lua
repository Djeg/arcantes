local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local doc_block_snip = s({ trig = "db", desc = "TSDoc snippet" }, {
	t({ "/**", " * " }),
	i(1),
	t({ "", " */" }),
})

local function_snippet = s({ trig = "fn", desc = "Function snippet" }, {
	i(1, "export "),
	i(2, "async "),
	t("function "),
	i(3, "name"),
	t({ "() {", "\t" }),
	i(0),
	t({ "", "}" }),
})

return {
	doc_block_snip,
	function_snippet,
}
