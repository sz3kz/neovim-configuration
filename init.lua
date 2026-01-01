require("config.lazy")
require("windows")

-- Configure Theme: gruvbox-material
vim.g.gruvbox_material_enable_italic = true
vim.cmd.colorscheme('gruvbox-material')

-- Disable Codeium inline suggestions (mostly interested in the interractive chat session)
vim.g.codeium_manual = true
vim.g.codeium_render = false
