-- Procrastination-Based Text Effects

-- Configurations
local configurations = function()
  vim.keymap.set("n", "<leader>fmlmir", "<cmd>CellularAutomaton make_it_rain<CR>")
  vim.keymap.set("n", "<leader>fmlgof", "<cmd>CellularAutomaton game_of_life<CR>")
  vim.keymap.set("n", "<leader>fmls", "<cmd>CellularAutomaton scramble<CR>")
end

-- Plugin Installation Boilerplate
return {
  'eandrju/cellular-automaton.nvim',
  lazy = false, -- lazy = true leads to uninitialized keybinds at startup
  config = configurations
}
