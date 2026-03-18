require("config.lazy")
require("windows")

-- Configure Theme: gruvbox-material
vim.g.gruvbox_material_enable_italic = true
vim.cmd.colorscheme('gruvbox-material')

-- tabulation to 2 spaces
vim.opt.tabstop = 2 
vim.opt.softtabstop = 2 
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Add key shortcut to add .cpp source file to compilation
