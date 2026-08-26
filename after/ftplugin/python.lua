-- Python friendly indentation

local python_width = 4
vim.opt_local.expandtab = true                -- tabs -> spaces 
vim.opt_local.tabstop = python_width          -- tabulation width (visual)
-- vim.opt_local.softtabstop = python_width  -- tabulation width (editional)
vim.opt_local.shiftwidth = python_width       -- "<<" & ">>" indentation width
vim.opt_local.smartindent = true              -- automatic indents

vim.lsp.config['basedpyright'] = {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { 
    "pyrightconfig.json", "pyproject.toml", 
    "setup.py", "setup.cfg", 
    "requirements.txt", "Pipfile", ".git" 
  },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly"
      },
      disableTaggedHints = true
    }
  },
}

vim.lsp.enable('basedpyright')
