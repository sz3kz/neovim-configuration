-- Python friendly indentation

local nix_width = 2
vim.opt_local.expandtab = true                -- tabs -> spaces 
vim.opt_local.tabstop = nix_width          -- tabulation width (visual)
-- vim.opt_local.stofttabstop = nix_width  -- tabulation width (editional)
vim.opt_local.shiftwidth = nix_width       -- "<<" & ">>" indentation width
vim.opt_local.smartindent = true              -- automatic indents
