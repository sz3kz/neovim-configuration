-- Persistence.nvim 


-- Plugin Installation Boilerplate
return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
    -- minimum number of file buffers that need to be open to save
    -- Set to 0 to always save
    need = 1,
    branch = true, -- use git branch to save session
  },
  keys = {
    -- Load the session for the current directory
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    
    -- Select a session to load
    { "<leader>qS", function() require("persistence").select() end, desc = "Select Session" },
    
    -- Load the last session
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    
    -- Stop Persistence (session won't be saved on exit)
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  }
}
