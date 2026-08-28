local function alias(from, to)
  return function()
    local cmdtype = vim.fn.getcmdtype()
    local cmdline = vim.fn.getcmdline()
    if cmdtype == ':' and cmdline == from then
      return to
    else
      return from
    end
  end
end

vim.keymap.set('ca', 'q', alias('q', 'QuitDisabled'), { expr = true })
vim.api.nvim_create_user_command('QuitDisabled', function()
    print("neovim: unbased command: \'q\', use `<C-w>q` or `ZQ`(:q!).")
end, {})


vim.keymap.set('ca', 'wq', alias('wq', 'WriteQuitDisabled'), { expr = true })
vim.api.nvim_create_user_command('WriteQuitDisabled', function()
    print("neovim: unbased command: \'wq\', use `ZZ`.")
end, {})

vim.keymap.set('n', 'Zqa', ":qa<CR>")       -- CUSTOM, not a default 'Z*' keybind
vim.keymap.set('n', 'ZqA', ":qa!<CR>")       -- CUSTOM, not a default 'Z*' keybind
vim.keymap.set('ca', 'qa', alias('qa', 'QuitAllDisabled'), { expr = true })
vim.api.nvim_create_user_command('QuitAllDisabled', function()
    print("neovim: unbased command: \'qa\', use `Zqa` or `ZqA`(:qa!).")
end, {})

vim.keymap.set('n', 'Zw', ":w<CR>")       -- CUSTOM, not a default 'Z*' keybind
vim.keymap.set('n', 'ZW', ":w!<CR>")       -- CUSTOM, not a default 'Z*' keybind
vim.keymap.set('ca', 'w', alias('w', 'WriteDisabled'), { expr = true })
vim.api.nvim_create_user_command('WriteDisabled', function()
    print("neovim: unbased command: \'w\', use `Zw` or `ZW`(:w!).")
end, {})

vim.keymap.set('n', 'Ze', ":e<CR>")       -- CUSTOM, not a default 'Z*' keybind
vim.keymap.set('n', 'ZE', ":e!<CR>")       -- CUSTOM, not a default 'Z*' keybind
vim.keymap.set('ca', 'e', alias('e', 'ReloadDisabled'), { expr = true })
vim.api.nvim_create_user_command('ReloadDisabled', function()
    print("neovim: unbased command: \'e\', use `Ze` or `ZE`(:e!).")
end, {})
