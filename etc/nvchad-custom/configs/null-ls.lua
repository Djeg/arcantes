local null_ls = require("null-ls")

local b = null_ls.builtins

local has_config_for = function(matcher)
  return function()
    local rootPath = vim.fn.getcwd()
    local pipeline = io.popen("ls -a " .. rootPath)

    if not pipeline then
      return false
    end

    for filename in pipeline:lines() do
      if string.find(filename, matcher) then
        return true
      end
    end

    return false
  end
end

local sources = {

  -- webdev stuff
  b.formatting.prettier.with({
    condition = has_config_for("prettier"),
    cwd = function()
      return vim.fn.getcwd()
    end,
  }),
  b.diagnostics.eslint_d.with({
    condition = has_config_for("eslint"),
    cwd = function()
      return vim.fn.getcwd()
    end,
  }),
  b.code_actions.eslint_d.with({
    condition = has_config_for("eslint"),
    cwd = function()
      return vim.fn.getcwd()
    end,
  }),

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = true,
  sources = sources,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})
