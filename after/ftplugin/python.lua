-- Python friendly indentation

local python_width = 4
vim.opt_local.expandtab = true                -- tabs -> spaces 
vim.opt_local.tabstop = python_width          -- tabulation width (visual)
-- vim.opt_local.stofttabstop = python_width  -- tabulation width (editional)
vim.opt_local.shiftwidth = python_width       -- "<<" & ">>" indentation width
vim.opt_local.smartindent = true              -- automatic indents
