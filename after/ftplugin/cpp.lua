-- C++ friendly indentation

local cpp_width = 2
vim.opt_local.expandtab = true                -- tabs -> spaces 
vim.opt_local.tabstop = cpp_width             -- tabulation width (visual)
-- vim.opt_local.stofttabstop = cpp_width     -- tabulation width (editional)
vim.opt_local.shiftwidth = cpp_width          -- "<<" & ">>" indentation width
vim.opt_local.smartindent = true              -- automatic indents

vim.lsp.config['clangd'] = {
  capabilities = {
    offsetEncoding = { "utf-8", "utf-16" },
    textDocument = {
      completion = {
        editsNearCursor = true
      }
    }
  },
  cmd = {
    "clangd",
    "--background-index",     -- Index project in the background
    "--clang-tidy",           -- Enable clang-tidy diagnostics
    "--header-insertion=iwyu", -- "Include what you use"
    "--completion-style=detailed",
    "--function-arg-placeholders",
  },
  filetypes = {
    "c", "c.doxygen", "cpp", 
    "cpp.doxygen", "objc", "objcpp", 
    "cuda"
  },
  root_markers = { 
    ".clangd", ".clang-tidy", ".clang-format", 
    "compile_commands.json", "compile_flags.txt", 
    "configure.ac", ".git" 
  },
  init_options = {
    fallbackFlags = { "-std=c++20" }, -- Use this if no compile_commands.json is found
  }
}

vim.lsp.enable('clangd')
