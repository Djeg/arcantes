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

local get_entity_class = function()
	local filename = file_utils.get_pascal_cased_filename(vim.fn.expand("%"))

	return filename:gsub("Repository$", "")
end

local doctrine_repository_snippet = s({ trig = "dcr", desc = "Doctrine repository class snippet" }, {
	t("<?php"),
	t({ "", "", "" }),
	t("namespace "),
	f(get_namespace_from_buffer, {}),
	t({ ";", "", "" }),
	t("use Doctrine\\Bundle\\DoctrineBundle\\Repository\\ServiceEntityRepository;"),
	t({ "", "" }),
	t("use Doctrine\\Persistence\\ManagerRegistry;"),
	t({ "", "", "" }),
	t("/**"),
	t({ "", " * @extends ServiceEntityRepository<" }),
	f(get_entity_class, {}),
	t(">"),
	t({ "", " */" }),
	t({ "", "class " }),
	f(get_class_name_from_buffer, {}),
	t(" extends ServiceEntityRepository"),
	t({ "", "{" }),
	t({ "", "\tpublic function __construct(ManagerRegistry $registry)" }),
	t({ "", "\t{", "" }),
	t("\t\tparent::__construct($registry, "),
	f(get_entity_class, {}),
	t("::class);"),
	t({ "", "\t}" }),
	t({ "", "", "\t" }),
	i(0),
	t({ "", "}" }),
})

local doctrine_uuid_entity_snippet = s({ trig = "dce", desc = "Doctrine entity with UUID id snippet" }, {
	t("<?php"),
	t({ "", "", "" }),
	t("namespace "),
	f(get_namespace_from_buffer, {}),
	t({ ";", "", "" }),
	t("use Doctrine\\ORM\\Mapping as ORM;"),
	t({ "", "" }),
	t("use Symfony\\Component\\Uid\\Uuid;"),
	t({ "", "", "" }),
	t("#[ORM\\Entity]"),
	t({ "", "class " }),
	f(get_class_name_from_buffer, {}),
	t({ "", "{" }),
	t({ "", "\t#[ORM\\Id]" }),
	t({ "", '\t#[ORM\\Column(type: "uuid", unique: true)]' }),
	t({ "", '\t#[ORM\\GeneratedValue(strategy: "CUSTOM")]' }),
	t({ "", '\t#[ORM\\CustomIdGenerator(class: "doctrine.uuid_generator")]' }),
	t({ "", "\tprivate ?Uuid $id = null;" }),
	t({ "", "", "\tpublic function getId(): ?Uuid" }),
	t({ "", "\t{" }),
	t({ "", "\t\treturn $this->id;" }),
	t({ "", "\t}" }),
	t({ "", "", "\t" }),
	i(0),
	t({ "", "}" }),
})

local getter_name = function(property_name)
	local upper = property_name:gsub("_(.)", function(c)
		return c:upper()
	end)
	return "get" .. upper:gsub("^.", string.upper)
end

local setter_name = function(property_name)
	local upper = property_name:gsub("_(.)", function(c)
		return c:upper()
	end)
	return "set" .. upper:gsub("^.", string.upper)
end

local doctrine_column_snippet = s({ trig = "dcc", desc = "Doctrine Column attribute" }, {
	t('#[ORM\\Column(type: "'),
	i(1, "string"),
	t('"'),
	f(function(args)
		local type_val = args[1][1]
		if type_val == "string" then
			return ", length: 255"
		end
		return ""
	end, { 1 }),
	t({ ")]" }),
	f(function(args)
		local type_val = args[1][1]
		if type_val ~= "string" and type_val ~= "text" then
			return ""
		end
		return ""
	end, { 1 }),
	t({ "", "private ?" }),
	f(function(args)
		local type_map = {
			string = "string",
			integer = "int",
			smallint = "int",
			bigint = "string",
			boolean = "bool",
			text = "string",
			datetime = "\\DateTimeInterface",
			datetime_immutable = "\\DateTimeImmutable",
			datetimetz = "\\DateTimeInterface",
			date = "\\DateTimeInterface",
			time = "\\DateTimeInterface",
			decimal = "string",
			float = "float",
			json = "array",
			simple_array = "array",
			guid = "string",
		}
		return type_map[args[1][1]] or "mixed"
	end, { 1 }),
	t(" $"),
	i(2, "property"),
	t(" = null;"),
})

local doctrine_id_snippet = s({ trig = "dcid", desc = "Doctrine Id with GeneratedValue" }, {
	t("\t#[ORM\\Id]"),
	t({ "", "\t#[ORM\\GeneratedValue]" }),
	t({ "", '\t#[ORM\\Column(type: "integer")]' }),
	t({ "", "\tprivate ?int $id = null;", "", "" }),
	t("\tpublic function getId(): ?int"),
	t({ "", "\t{" }),
	t({ "", "\t\treturn $this->id;", "", "\t}" }),
	t({ "", "", "\tpublic function setId(?int $id): self" }),
	t({ "", "\t{" }),
	t({ "", "\t\t$this->id = $id;", "", "", "\t\treturn $this;", "", "\t}" }),
})

local doctrine_many_to_one_snippet = s({ trig = "dcmto", desc = "Doctrine ManyToOne with JoinColumn" }, {
	t("\t#[ORM\\ManyToOne(targetEntity: "),
	i(1, "RelatedEntity"),
	t('::class, inversedBy: "'),
	i(2, "inverseProperty"),
	t('")]'),
	t({ "", "\t#[ORM\\JoinColumn(nullable: " }),
	i(3, "false"),
	t(")]"),
	t({ "", "\tprivate ?" }),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t(" $"),
	i(4, "property"),
	t(" = null;"),
	t({ "", "", "\tpublic function get" }),
	f(function(args)
		return getter_name(args[1][1])
	end, { 4 }),
	t("(): ?"),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t({ "", "\t{" }),
	t({ "", "\t\treturn $this->" }),
	f(function(args)
		return args[1][1]
	end, { 4 }),
	t({ ";", "", "\t}" }),
	t({ "", "", "\tpublic function set" }),
	f(function(args)
		return getter_name(args[1][1])
	end, { 4 }),
	t("(?\\"),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t(" $"),
	f(function(args)
		return args[1][1]
	end, { 4 }),
	t("): self"),
	t({ "", "\t{" }),
	t({ "", "\t\t$this->" }),
	f(function(args)
		return args[1][1]
	end, { 4 }),
	t(" = $"),
	f(function(args)
		return args[1][1]
	end, { 4 }),
	t({ ";", "", "", "\t\treturn $this;", "", "\t}" }),
})

local doctrine_one_to_many_snippet = s({ trig = "dcont", desc = "Doctrine OneToMany (inverse side)" }, {
	t("\t#[ORM\\OneToMany(targetEntity: "),
	i(1, "RelatedEntity"),
	t('::class, mappedBy: "'),
	i(2, "mappedByProperty"),
	t('")]'),
	t({ "", "\tprivate ?\\Doctrine\\Common\\Collections\\Collection $" }),
	i(3, "property"),
	t(" = null;"),
	t({ "", "", "\tpublic function __construct()" }),
	t({ "", "\t{" }),
	t({ "", "\t\t$this->" }),
	f(function(args)
		return args[1][1]
	end, { 3 }),
	t(" = new \\Doctrine\\Common\\Collections\\ArrayCollection();"),
	t({ "", "\t}" }),
	t({ "", "", "\tpublic function get" }),
	f(function(args)
		return getter_name(args[1][1])
	end, { 3 }),
	t("(): \\Doctrine\\Common\\Collections\\Collection"),
	t({ "", "\t{" }),
	t({ "", "\t\treturn $this->" }),
	f(function(args)
		return args[1][1]
	end, { 3 }),
	t({ ";", "", "\t}" }),
	t({ "", "", "\tpublic function add" }),
	f(function(args)
		return args[1][1]:gsub("s$", "")
	end, { 3 }),
	t("(\\"),
	i(1),
	t(" $"),
	f(function(args)
		return args[1][1]:gsub("s$", "")
	end, { 3 }),
	t("): self"),
	t({ "", "\t{" }),
	t({ "", "\t\tif (!$this->" }),
	f(function(args)
		return args[1][1]
	end, { 3 }),
	t("->contains($"),
	f(function(args)
		return args[1][1]:gsub("s$", "")
	end, { 3 }),
	t({ ")) {" }),
	t({ "", "\t\t\t$this->" }),
	f(function(args)
		return args[1][1]
	end, { 3 }),
	t("->add($"),
	f(function(args)
		return args[1][1]:gsub("s$", "")
	end, { 3 }),
	t({ ");", "" }),
	t({ "", "\t\t}", "", "", "\t\treturn $this;", "", "\t}" }),
	t({ "", "", "\tpublic function remove" }),
	f(function(args)
		return args[1][1]:gsub("s$", "")
	end, { 3 }),
	t("(\\"),
	i(1),
	t(" $"),
	f(function(args)
		return args[1][1]:gsub("s$", "")
	end, { 3 }),
	t("): self"),
	t({ "", "\t{" }),
	t({ "", "\t\tif ($this->" }),
	f(function(args)
		return args[1][1]
	end, { 3 }),
	t("->removeElement($"),
	f(function(args)
		return args[1][1]:gsub("s$", "")
	end, { 3 }),
	t({ ")) {" }),
	t({ "", "\t\t\t", "" }),
	i(0),
	t({ "", "\t\t}", "", "", "\t\treturn $this;", "", "\t}" }),
})

local doctrine_one_to_one_snippet = s({ trig = "dcon2o", desc = "Doctrine OneToOne" }, {
	t("\t#[ORM\\OneToOne(targetEntity: "),
	i(1, "RelatedEntity"),
	t('::class, inversedBy: "'),
	i(2, "inverseProperty"),
	t('")]'),
	t({ "", "\t#[ORM\\JoinColumn(nullable: " }),
	i(3, "false"),
	t(")]"),
	t({ "", "\tprivate ?" }),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t(" $"),
	i(4, "property"),
	t(" = null;"),
	t({ "", "", "\tpublic function get" }),
	f(function(args)
		return getter_name(args[1][1])
	end, { 4 }),
	t("(): ?"),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t({ "", "\t{" }),
	t({ "", "\t\treturn $this->" }),
	f(function(args)
		return args[1][1]
	end, { 4 }),
	t({ ";", "", "\t}" }),
	t({ "", "", "\tpublic function set" }),
	f(function(args)
		return getter_name(args[1][1])
	end, { 4 }),
	t("(?\\"),
	f(function(args)
		return args[1][1]
	end, { 1 }),
	t(" $"),
	f(function(args)
		return args[1][1]
	end, { 4 }),
	t("): self"),
	t({ "", "\t{" }),
	t({ "", "\t\t$this->" }),
	f(function(args)
		return args[1][1]
	end, { 4 }),
	t(" = $"),
	f(function(args)
		return args[1][1]
	end, { 4 }),
	t({ ";", "", "", "\t\treturn $this;", "", "\t}" }),
})

local doctrine_join_column_snippet = s({ trig = "dcjc", desc = "Doctrine JoinColumn" }, {
	t('\t#[ORM\\JoinColumn(name: "'),
	i(1, "join_column_name"),
	t('", referencedColumnName: "'),
	i(2, "id"),
	t('", nullable: '),
	i(3, "false"),
	t(")]"),
	t({ "", "\tprivate ?" }),
	f(function(args)
		return args[1][1]:gsub("_id$", ""):gsub("_", "_"):gsub("^.", string.upper)
	end, { 1 }),
	t(" $"),
	i(4, "property"),
	t(" = null;"),
})

local doctrine_table_snippet = s({ trig = "dctable", desc = "Doctrine Table (class attribute)" }, {
	t('#[ORM\\Table(name: "'),
	i(1, "table_name"),
	t('")]'),
	t({ "", '#[ORM\\Index(name: "' }),
	i(2, "index_name"),
	t('", columns: ["'),
	i(3, "column"),
	t('"])]'),
})

return {
	doctrine_repository_snippet,
	doctrine_uuid_entity_snippet,
	doctrine_column_snippet,
	doctrine_id_snippet,
	doctrine_many_to_one_snippet,
	doctrine_one_to_many_snippet,
	doctrine_one_to_one_snippet,
	doctrine_join_column_snippet,
	doctrine_table_snippet,
}
