-- General Configurations - Tabs 


-- Record Everything
vim.opt.sessionoptions = { "buffers", "curdir", "sesdir", "tabpages", "winsize", "help", "globals", "folds", "blank" }

-- Automatically open nvim-tree when a session is restored
vim.api.nvim_create_autocmd("User", {
  pattern = "PersistenceLoadPost",
  callback = function()
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
  end,
})
