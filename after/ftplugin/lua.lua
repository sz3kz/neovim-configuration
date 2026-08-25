-- Lua friendly indentation

local lua_width = 2
vim.opt_local.expandtab = true                -- tabs -> spaces 
vim.opt_local.tabstop = lua_width          -- tabulation width (visual)
-- vim.opt_local.stofttabstop = lua_width  -- tabulation width (editional)
vim.opt_local.shiftwidth = lua_width       -- "<<" & ">>" indentation width
vim.opt_local.smartindent = true              -- automatic indents

vim.lsp.config['lua_ls'] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { 
    { ".emmyrc.json", ".luarc.json", ".luarc.jsonc" }, 
    { ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" }, 
    { ".git" } 
  },
  settings = {
    Lua = {
      codeLens = {
        enable = true
      },
      hint = {
        enable = true,
        semicolon = "Disable"
      }
    }
  },
}

vim.lsp.enable('lua_ls')
