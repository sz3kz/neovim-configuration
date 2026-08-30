return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20

            -- for html output???
            vim.g.molten_open_cmd = "xdg-open"
            vim.g.molten_auto_open_html_in_browser = true

            vim.g.molten_auto_open_output = false -- auto open???
            vim.g.molten_wrap_output = true -- virtual text wrapping
            vim.g.molten_virt_text_output = true -- output as virtual text
            vim.g.molten_virt_lines_off_by_1 = true -- output under cell delimiter


        end,
        keys = {
          {
            mode = "n",
            "<localleader>mi",
            ":MoltenInit<CR>",
            desc = "initialize kernel",
            silent = true,
            ft = {"markdown"},
          },
          {
            mode = "n",
            "<localleader>md",
            ":MoltenDeinit<CR>",
            desc = "shut down kernel",
            silent = true,
            ft = {"markdown"},
          },
          {
            mode = "n",
            "<localleader>mr",
            ":MoltenRestart<CR>",
            desc = "restart kernel",
            silent = true,
            ft = {"markdown"},
          },
          {
            mode = "n",
            "<localleader>e",
            ":MoltenEvaluateOperator<CR>",
            desc = "(DEPRECATED)evaluate motion", -- Why use this in general?
            silent = true,
            ft = {"markdown"},
          },
          {
            mode = "n",
            "<localleader>os",
            ":noautocmd MoltenEnterOutput<CR>",
            desc = "open output window",
            silent = true,
            ft = {"markdown"},
          },
          {
            mode = "n",
            "<localleader>oh",
            ":MoltenHideOutput<CR>",
            desc = "close output window",
            silent = true,
            ft = {"markdown"},
          },
          {
            mode = "n",
            "<localleader>rr",
            ":MoltenReevaluateCell<CR>",
            desc = "(DEPRECATED)re-evaluate cell", -- Why not just run the cell again?
            silent = true,
            ft = {"markdown"},
          },
          {
            mode = "v",
            "<localleader>rvl",
            ":<C-u>MoltenEvaluateVisual<CR>gv",
            desc = "execute lines selected via visual selection",
            silent = true,
            ft = {"markdown"},
          },
          {
            -- for html
            mode = "n",
            "<localleader>mx",
            ":MoltenOpenInBrowser<CR>",
            desc = "open output in browser (HTML ONLY)",
            silent = true,
            ft = {"markdown"},
          },
        }
    },
    {
        -- see the image.nvim readme for more information about configuring this plugin
        "3rd/image.nvim",
        opts = {
            backend = "kitty", -- whatever backend you would like to use
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    }
}
