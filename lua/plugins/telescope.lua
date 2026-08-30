-- Telescope


-- Plugin Installation Boilerplate
return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      {
        mode = "n",
        "<leader>tff",
        function() require('telescope.builtin').find_files() end,
        desc = "Telescope: find files",
      },
      {
        mode = "n",
        "<leader>tfg",
        function() require('telescope.builtin').live_grep() end,
        desc = "Telescope: string search in CWD",
      },
      {
        mode = "n",
        "<leader>tfb",
        function() require('telescope.builtin').buffers() end,
        desc = "Telescope: list active buffers",
      },
      {
        mode = "n",
        "<leader>tfh",
        function() require('telescope.builtin').help_tags() end,
        desc = "Telescope: list available help tags",
      },
    },
}
