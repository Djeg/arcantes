-- setup colorscheme safely
local status, _ = pcall(vim.cmd, "colorscheme kanagawa-wave")
if not status then
  return
end

-- transparent background
vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
-- Selection
vim.cmd([[ hi Visual guibg=#414141 ctermbg=239 ]])
-- Color column
vim.cmd([[ hi ColorColumn guibg=#262626 ctermbg=234 ]])
