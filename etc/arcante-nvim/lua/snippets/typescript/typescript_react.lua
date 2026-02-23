local ls = require("luasnip")
local file_utils = require("utils.files")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local get_component_name_from_buffer = function()
	local pacsal_cased_filename = file_utils.get_pascal_cased_filename(vim.fn.expand("%"))

	return pacsal_cased_filename
end

local get_component_props_name_from_buffer = function()
	local pacsal_cased_filename = file_utils.get_pascal_cased_filename(vim.fn.expand("%"))

	return pacsal_cased_filename .. "Props"
end

local react_component_snippet = s({ trig = "rc", desc = "React component snippet" }, {
	t({ "import type { ReactNode } from 'react';", "", "" }),
	t("export function "),
	i(1),
	f(get_component_name_from_buffer, { 1 }),
	t({ "(): ReactNode {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local react_component_with_props_snippet = s({ trig = "rcp", desc = "React component with props snippet" }, {
	t({ "import type { ReactNode } from 'react';", "", "" }),
	t("export type "),
	f(get_component_props_name_from_buffer, {}),
	t(" = {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}", "", "" }),
	t("export function "),
	f(get_component_name_from_buffer, {}),
	t("({ }: "),
	f(get_component_props_name_from_buffer, {}),
	t({ "): ReactNode {", "\t" }),
	t("return null"),
	t({ "", "}" }),
})

local react_component_with_interface_props_snippet = s(
	{ trig = "rcip", desc = "React component with interface props snippet" },
	{
		t({ "import type { ReactNode } from 'react';", "", "" }),
		t("export interface "),
		f(get_component_props_name_from_buffer, {}),
		t(" {"),
		t({ "", "\t" }),
		i(0),
		t({ "", "}", "", "" }),
		t("export function "),
		f(get_component_name_from_buffer, {}),
		t("({ }: "),
		f(get_component_props_name_from_buffer, {}),
		t({ "): ReactNode {", "\t" }),
		t("return null"),
		t({ "", "}" }),
	}
)

local standalone_react_component_snippet = s({ trig = "src", desc = "Standalone React component snippet" }, {
	t("export function "),
	i(1),
	f(get_component_name_from_buffer, { 1 }),
	t({ "(): ReactNode {", "\t" }),
	i(0),
	t({ "", "}" }),
})

local standalone_react_component_props = s({ trig = "srp", desc = "Standalone React component props snippet" }, {
	t("export type "),
	i(1),
	f(get_component_props_name_from_buffer, { 1 }),
	t(" = {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}", "", "" }),
})

local standalone_react_component_interface_props = s(
	{ trig = "srip", desc = "Standalone React component interface props snippet" },
	{
		t("export interface "),
		i(1),
		f(get_component_props_name_from_buffer, { 1 }),
		t(" {"),
		t({ "", "\t" }),
		i(0),
		t({ "", "}", "", "" }),
	}
)

local use_state_snippet = s({ trig = "us", desc = "useState snippet" }, {
	t("const ["),
	i(1, "state"),
	t(", set"),
	f(function(args)
		return args[1][1]:gsub("^%l", string.upper)
	end, { 1 }),
	t("] = useState("),
	i(0),
	t(");"),
})

local use_ref_snippet = s({ trig = "ur", desc = "useRef snippet" }, {
	t("const "),
	i(1, "ref"),
	t(" = useRef("),
	i(0),
	t(");"),
})

local use_effect_snippet = s({ trig = "ue", desc = "useEffect snippet" }, {
	t("useEffect(() => {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}, []);" }),
})

local use_effect_with_deps_snippet = s({ trig = "ued", desc = "useEffect with dependencies snippet" }, {
	t("useEffect(() => {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}, [" }),
	i(1, "deps"),
	t("]);"),
})

return {
	react_component_snippet,
	react_component_with_props_snippet,
	react_component_with_interface_props_snippet,
	standalone_react_component_snippet,
	standalone_react_component_props,
	standalone_react_component_interface_props,
	use_state_snippet,
	use_ref_snippet,
	use_effect_snippet,
	use_effect_with_deps_snippet,
}
