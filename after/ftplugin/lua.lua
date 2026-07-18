-- Lua friendly indentation

local lua_width = 2
vim.opt_local.expandtab = true                -- tabs -> spaces 
vim.opt_local.tabstop = lua_width          -- tabulation width (visual)
-- vim.opt_local.stofttabstop = lua_width  -- tabulation width (editional)
vim.opt_local.shiftwidth = lua_width       -- "<<" & ">>" indentation width
vim.opt_local.smartindent = true              -- automatic indents
