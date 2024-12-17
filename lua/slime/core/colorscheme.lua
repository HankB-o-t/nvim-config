local status, _ = pcall(vim.cmd, "colorscheme onedark")

if not status then
  print("instala los colores pa")
  return
end
