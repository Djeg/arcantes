local table_utils = require("utils.tables")
local phpClassSnippets = require("snippets.php.php_class")
local symfonySnippets = require("snippets.php.symfony_snippets")

return table_utils.merge(phpClassSnippets, symfonySnippets)
