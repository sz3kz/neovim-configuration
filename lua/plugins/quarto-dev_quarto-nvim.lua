return {
  "quarto-dev/quarto-nvim",
  ft = {"quarto", "markdown"},
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  keys = {
    {
      mode = "n",
      "<localleader>rc",
      function() require("quarto.runner").run_cell() end,
      desc = "run cell",
      silent = true,
      ft = {"quarto", "markdown"},
    },
    {
      mode = "n",
      "<localleader>ra",
      function() require("quarto.runner").run_above() end,
      desc = "run cell and above",
      silent = true,
      ft = {"quarto", "markdown"},
    },
    {
      mode = "n",
      "<localleader>rA",
      function() require("quarto.runner").run_all() end,
      desc = "run all cells",
      silent = true,
      ft = {"quarto", "markdown"},
    },
    {
      mode = "n",
      "<localleader>rl",
      function() require("quarto.runner").run_line() end,
      desc = "run line",
      silent = true,
      ft = {"quarto", "markdown"},
    },
    {
      mode = "v",
      "<localleader>r",
      function() require("quarto.runner").run_range() end,
      desc = "run visual range",
      silent = true,
      ft = {"quarto", "markdown"},
    },
    {
      mode = "n",
      "<localleader>RA",
      function() require("quarto.runner").run_all(true) end,
      desc = "run all cells of all languages",
      silent = true,
      ft = {"quarto", "markdown"},
    }
  },

  config = function()
    local quarto = require("quarto")
    quarto.setup({
      lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = { "python" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        -- NOTE: setup your own keymaps:
        hover = "H",
        definition = "gd",
        rename = "<leader>rn",
        references = "gr",
        format = "<leader>gf",
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    })
  end
}
