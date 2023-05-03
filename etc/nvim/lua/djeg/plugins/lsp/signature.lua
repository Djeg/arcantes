-- import plugin safely
local setup, signature = pcall(require, "lsp_signature")
if not setup then
  print("Unable to retrieve the lsp_signature plugin")
  return
end

signature.setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
})

-- keymaps for signature
vim.keymap.set("n", "<leader>df", function()
  vim.lsp.buf.hover()
end, { silent = true, noremap = false, desc = "Display signature" })
