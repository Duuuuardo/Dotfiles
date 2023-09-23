local themes = {
  gruvbox = "gruvbox",
  gruvbox_material = "gruvbox-material",
  mocha = "catppuccin-mocha",
}

lvim.transparent_window = true
lvim.colorscheme = themes.gruvbox_material

if vim.g.neovide then
  lvim.transparent_window = false
  return
end
