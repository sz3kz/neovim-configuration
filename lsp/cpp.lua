return {
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

