-- setup colorscheme safely
local status, _ = pcall(vim.cmd, "colorscheme carbonfox")
if not status then
  local secondStatus, _ = pcall(vim.cmd, "colorscheme nightfox")
  if not secondStatus then
    print("Colorscheme not found!")
    return
  end
end
