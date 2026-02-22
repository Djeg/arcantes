local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fn_snippet = s({ trig = "fn", desc = "function snippet" }, {
	t("function "),
	i(1, "name"),
	t("(): "),
	i(2, "string"),
	t({ " {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local fn1_snippet = s({ trig = "fn1", desc = "function snippet with one argument" }, {
	t("function "),
	i(1, "name"),
	t("("),
	i(2, "arg"),
	t(": "),
	i(3, "string"),
	t("): "),
	i(4, "string"),
	t({ " {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local fn2_snippet = s({ trig = "fn2", desc = "function snippet with two arguments" }, {
	t("function "),
	i(1, "name"),
	t("("),
	i(2, "arg1"),
	t(": "),
	i(3, "string"),
	t(", "),
	i(4, "arg2"),
	t(": "),
	i(5, "string"),
	t("): "),
	i(6, "string"),
	t({ " {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local efn_snippet = s({ trig = "efn", desc = "exported function snippet" }, {
	t("export function "),
	i(1, "name"),
	t("(): "),
	i(2, "string"),
	t({ " {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local efn1_snippet = s({ trig = "efn1", desc = "exported function snippet with one argument" }, {
	t("export function "),
	i(1, "name"),
	t("("),
	i(2, "arg"),
	t(": "),
	i(3, "string"),
	t("): "),
	i(4, "string"),
	t({ " {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local efn2_snippet = s({ trig = "efn2", desc = "exported function snippet with two arguments" }, {
	t("export function "),
	i(1, "name"),
	t("("),
	i(2, "arg1"),
	t(": "),
	i(3, "string"),
	t(", "),
	i(4, "arg2"),
	t(": "),
	i(5, "string"),
	t("): "),
	i(6, "string"),
	t({ " {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local afn_snippet = s({ trig = "afn", desc = "async function snippet" }, {
	t("async function "),
	i(1, "name"),
	t("(): Promise<"),
	i(2, "string"),
	t({ "> {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local afn1_snippet = s({ trig = "afn1", desc = "async function snippet with one argument" }, {
	t("async function "),
	i(1, "name"),
	t("("),
	i(2, "arg"),
	t(": "),
	i(3, "string"),
	t("): Promise<"),
	i(4, "string"),
	t({ "> {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local afn2_snippet = s({ trig = "afn2", desc = "async function snippet with two arguments" }, {
	t("async function "),
	i(1, "name"),
	t("("),
	i(2, "arg1"),
	t(": "),
	i(3, "string"),
	t(", "),
	i(4, "arg2"),
	t(": "),
	i(5, "string"),
	t("): Promise<"),
	i(6, "string"),
	t({ "> {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local eafn_snippet = s({ trig = "eafn", desc = "exported async function snippet" }, {
	t("export async function "),
	i(1, "name"),
	t("(): Promise<"),
	i(2, "string"),
	t({ "> {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local eafn1_snippet = s({ trig = "eafn1", desc = "exported async function snippet with one argument" }, {
	t("export async function "),
	i(1, "name"),
	t("("),
	i(2, "arg"),
	t(": "),
	i(3, "string"),
	t("): Promise<"),
	i(4, "string"),
	t({ "> {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local eafn2_snippet = s({ trig = "eafn2", desc = "exported async function snippet with two arguments" }, {
	t("export async function "),
	i(1, "name"),
	t("("),
	i(2, "arg1"),
	t(": "),
	i(3, "string"),
	t(", "),
	i(4, "arg2"),
	t(": "),
	i(5, "string"),
	t("): Promise<"),
	i(6, "string"),
	t({ "> {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local cfn_snippet = s({ trig = "cfn", desc = "const function snippet" }, {
	t("const "),
	i(1, "name"),
	t(" = (): "),
	i(2, "string"),
	t({ " => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local cfn1_snippet = s({ trig = "cfn1", desc = "const function snippet with one argument" }, {
	t("const "),
	i(1, "name"),
	t(" = ("),
	i(2, "arg"),
	t(": "),
	i(3, "string"),
	t("): "),
	i(4, "string"),
	t({ " => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local cfn2_snippet = s({ trig = "cfn2", desc = "const function snippet with two arguments" }, {
	t("const "),
	i(1, "name"),
	t(" = ("),
	i(2, "arg1"),
	t(": "),
	i(3, "string"),
	t(", "),
	i(4, "arg2"),
	t(": "),
	i(5, "string"),
	t("): "),
	i(6, "string"),
	t({ " => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local ecfn_snippet = s({ trig = "ecfn", desc = "exported const function snippet" }, {
	t("export const "),
	i(1, "name"),
	t(" = (): "),
	i(2, "string"),
	t({ " => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local ecfn1_snippet = s({ trig = "ecfn1", desc = "exported const function snippet with one argument" }, {
	t("export const "),
	i(1, "name"),
	t(" = ("),
	i(2, "arg"),
	t(": "),
	i(3, "string"),
	t("): "),
	i(4, "string"),
	t({ " => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local ecfn2_snippet = s({ trig = "ecfn2", desc = "exported const function snippet with two arguments" }, {
	t("export const "),
	i(1, "name"),
	t(" = ("),
	i(2, "arg1"),
	t(": "),
	i(3, "string"),
	t(", "),
	i(4, "arg2"),
	t(": "),
	i(5, "string"),
	t("): "),
	i(6, "string"),
	t({ " => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local eacfn_snippet = s({ trig = "eacfn", desc = "exported async const function snippet" }, {
	t("export const "),
	i(1, "name"),
	t(" = async (): Promise<"),
	i(2, "string"),
	t({ "> => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local eacfn1_snippet = s({ trig = "eacfn1", desc = "exported async const function snippet with one argument" }, {
	t("export const "),
	i(1, "name"),
	t(" = async ("),
	i(2, "arg"),
	t(": "),
	i(3, "string"),
	t("): Promise<"),
	i(4, "string"),
	t({ "> => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local eacfn2_snippet = s({ trig = "eacfn2", desc = "exported async const function snippet with two arguments" }, {
	t("export const "),
	i(1, "name"),
	t(" = async ("),
	i(2, "arg1"),
	t(": "),
	i(3, "string"),
	t(", "),
	i(4, "arg2"),
	t(": "),
	i(5, "string"),
	t("): Promise<"),
	i(6, "string"),
	t({ "> => {", "\t" }),
	i(0),
	t({ "", "}" }),
})

return {
	fn_snippet,
	fn1_snippet,
	fn2_snippet,
	efn_snippet,
	efn1_snippet,
	efn2_snippet,
	afn_snippet,
	afn1_snippet,
	afn2_snippet,
	eafn_snippet,
	eafn1_snippet,
	eafn2_snippet,
	cfn_snippet,
	cfn1_snippet,
	cfn2_snippet,
	ecfn_snippet,
	ecfn1_snippet,
	ecfn2_snippet,
	eacfn_snippet,
	eacfn1_snippet,
	eacfn2_snippet,
}
