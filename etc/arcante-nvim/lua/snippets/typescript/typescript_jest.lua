local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local describe_snippet = s({ trig = "desc", desc = "describe block snippet" }, {
	t("describe('"),
	i(1, "description"),
	t("', () => {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "});" }),
})

local it_snippet = s({ trig = "it", desc = "it block snippet" }, {
	t("it('"),
	i(1, "should do something"),
	t("', () => {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "});" }),
})

local ait_snippet = s({ trig = "ait", desc = "async it block snippet" }, {
	t("it('"),
	i(1, "should do something"),
	t("', async () => {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "});" }),
})

return {
	describe_snippet,
	it_snippet,
	ait_snippet,
}
