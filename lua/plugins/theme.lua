-- Gruvbox Material Theme


-- Configurations
local function configurations()
  vim.g.gruvbox_material_enable_italic = true
  vim.cmd.colorscheme("gruvbox-material")
end


-- Plugin Installation Boilerplate
return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = configurations
}
