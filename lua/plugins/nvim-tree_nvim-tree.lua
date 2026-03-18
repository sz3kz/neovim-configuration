-- NvimTree


-- Configurations
local function configurations()
  require("nvim-tree").setup {}
end


-- Plugin Installation Boilerplate
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = configurations
}
