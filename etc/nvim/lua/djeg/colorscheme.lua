-- setup colorscheme safely
local status, _ = pcall(vim.cmd, "colorscheme carbonfox")
if not status then
  return
end
