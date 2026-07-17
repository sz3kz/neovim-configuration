local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  -- Optional: Custom flags to make clangd faster and smarter
  cmd = {
    "clangd",
    "--background-index",     -- Index project in the background
    "--clang-tidy",           -- Enable clang-tidy diagnostics
    "--header-insertion=iwyu", -- "Include what you use"
    "--completion-style=detailed",
    "--function-arg-placeholders",
  },
  init_options = {
    fallbackFlags = { "-std=c++20" }, -- Use this if no compile_commands.json is found
  },
})
