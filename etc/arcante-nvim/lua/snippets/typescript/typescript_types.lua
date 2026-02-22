local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local type_snippet = s({ trig = "ty", desc = "type snippet" }, {
	t("type "),
	i(1, "Name"),
	t(" = {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}" }),
})

local export_type_snippet = s({ trig = "ety", desc = "exported type snippet" }, {
	t("export type "),
	i(1, "Name"),
	t(" = {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}" }),
})

local interface_snippet = s({ trig = "int", desc = "interface snippet" }, {
	t("interface "),
	i(1, "Name"),
	t(" {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}" }),
})

local export_interface_snippet = s({ trig = "eint", desc = "exported interface snippet" }, {
	t("export interface "),
	i(1, "Name"),
	t(" {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}" }),
})

return {
	type_snippet,
	interface_snippet,
	export_type_snippet,
	export_interface_snippet,
}
