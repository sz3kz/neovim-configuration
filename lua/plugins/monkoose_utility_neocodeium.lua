-- Neocodeium AI Autocomplete


-- Configurations
local function configurations()
    local neocodeium = require("neocodeium")
    neocodeium.setup({
      manual = true
    })
    vim.keymap.set("i", "<A-w>", function()
      require("neocodeium").accept()
    end)
    vim.keymap.set("i", "<A-q>", function()
      require("neocodeium").accept_line()
    end)
    vim.keymap.set("i", "<A-d>", function()
      require("neocodeium").cycle_or_complete()
    end)
    vim.keymap.set("i", "<A-s>", function()
      require("neocodeium").cycle_or_complete(-1)
    end)
    vim.keymap.set("i", "<A-c>", function()
      require("neocodeium").clear()
    end)
end


-- Plugin Installation Boilerplate
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = configurations
}

