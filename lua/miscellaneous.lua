-- General Configurations - Miscelaneous 


vim.opt.clipboard = 'unnamedplus' -- use the system clipboard directly
vim.opt.mouse = 'a'               -- ensure mouse mode

vim.keymap.set("n", "<leader>trm", ":terminal<CR>", { desc = "spawn terminal" })
