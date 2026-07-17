-- C++ friendly indentation

local cpp_width = 2
vim.opt_local.expandtab = true                -- tabs -> spaces 
vim.opt_local.tabstop = cpp_width             -- tabulation width (visual)
-- vim.opt_local.stofttabstop = cpp_width     -- tabulation width (editional)
vim.opt_local.shiftwidth = cpp_width          -- "<<" & ">>" indentation width
vim.opt_local.smartindent = true              -- automatic indents
