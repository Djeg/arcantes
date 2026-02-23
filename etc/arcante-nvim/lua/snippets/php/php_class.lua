local ls = require("luasnip")
local file_utils = require("utils.files")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local get_class_name_from_buffer = function()
	local pacsal_cased_filename = file_utils.get_pascal_cased_filename(vim.fn.expand("%"))

	return pacsal_cased_filename
end

local get_namespace_from_buffer = function()
	local namespace = file_utils.get_php_namespace_from_path(vim.fn.expand("%"))

	return namespace
end

local php_class_snippet = s({ trig = "cl", desc = "PHP class snippet" }, {
	t("<?php"),
	t({ "", "", "" }),
	t("namespace "),
	f(get_namespace_from_buffer, {}),
	t({ ";", "", "" }),
	t("class "),
	f(get_class_name_from_buffer, {}),
	t({ "", "{", "\t" }),
	i(0),
	t({ "", "}" }),
})

local php_construct_snippet = s({ trig = "cons", desc = "PHP construct method snippet" }, {
	t("public function __construct("),
	i(1, "string $param"),
	t(") {"),
	t({ "", "\t" }),
	i(0),
	t({ "", "}" }),
})

local php_attribute_snippet = s({ trig = "attr", desc = "PHP attribute snippet" }, {
	i(1, "private"),
	t(" "),
	i(2, "string"),
	t(" "),
	t("$"),
	i(3, "name"),
	t(";"),
})

local php_getter_snippet = s({ trig = "get", desc = "PHP getter method snippet" }, {
	t("public function get"),
	f(function(args)
		local name = args[1][1]
		return name:sub(1, 1):upper() .. name:sub(2)
	end, { 1 }),
	t("(): "),
	i(2, "string"),
	t({ "", "{", "\t" }),
	t("return $this->"),
	i(1, "name"),
	t({ ";", "}" }),
})

local php_setter_snippet = s({ trig = "set", desc = "PHP setter method snippet" }, {
	t("public function set"),
	f(function(args)
		local name = args[1][1]
		return name:sub(1, 1):upper() .. name:sub(2)
	end, { 1 }),
	t("("),
	i(2, "string"),
	t(" $"),
	i(1, "name"),
	t({ "): static", "{", "\t$this->" }),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t(" = $"),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t({ ";", "", "\treturn $this;", "}" }),
})

local php_getset_snippet = s({ trig = "getset", desc = "PHP getter and setter snippet" }, {
	t("public function get"),
	f(function(args)
		local name = args[1][1]
		return name:sub(1, 1):upper() .. name:sub(2)
	end, { 1 }),
	t("(): "),
	i(2, "string"),
	t({ "", "{", "\treturn $this->" }),
	i(1, "name"),
	t({ ";", "}", "", "" }),
	t("public function set"),
	f(function(args)
		local name = args[1][1]
		return name:sub(1, 1):upper() .. name:sub(2)
	end, { 1 }),
	t("("),
	f(function(args)
		return args[1][1]
	end, { 2 }),
	t(" $"),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t({ "): static", "{", "\t$this->" }),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t(" = $"),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t({ ";", "", "\treturn $this;", "}" }),
})

local php_method_snippet = s({ trig = "fn", desc = "PHP method snippet" }, {
	i(1, "public"),
	t(" function "),
	i(2, "methodName"),
	t("(): "),
	i(3, "void"),
	t({ "", "{" }),
	t({ "", "\t" }),
	i(0),
	t({ "", "}" }),
})

local php_method_one_snippet = s({ trig = "fn1", desc = "PHP method of one argument snippet" }, {
	i(1, "public"),
	t(" function "),
	i(2, "methodName"),
	t("("),
	i(3, "string $param"),
	t("): "),
	i(4, "void"),
	t({ "", "{" }),
	t({ "", "\t" }),
	i(0),
	t({ "", "}" }),
})

return {
	php_class_snippet,
	php_construct_snippet,
	php_attribute_snippet,
	php_getter_snippet,
	php_setter_snippet,
	php_getset_snippet,
	php_method_snippet,
	php_method_one_snippet,
}
