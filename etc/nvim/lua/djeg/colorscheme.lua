-- setup colorscheme safely
local status, _ = pcall(vim.cmd, "colorscheme kanagawa-wave")
if not status then
  return
end

-- transparent background
vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
