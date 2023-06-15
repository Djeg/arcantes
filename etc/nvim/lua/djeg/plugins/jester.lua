-- import jester plugin safely
local status, jester = pcall(require, "jester")
if not status then
  return
end

-- add keymap for jester
vim.keymap.set("n", "<leader>tr", function()
  jester.run()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", function()
  jester.run_file()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tl", function()
  jester.run_last()
end, { noremap = true, silent = true })
