vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = true, -- Disable LSP text.
})

local function toggle_diagnostics_style()
  local current_config = vim.diagnostic.config()
  if current_config.virtual_lines then
    -- Switch to virtual_text mode
    vim.diagnostic.config({
      virtual_lines = false,
      virtual_text = true,
    })
    vim.notify("Diagnostic mode: virtual_text", vim.log.levels.INFO)
  else
    vim.diagnostic.config({
      virtual_lines = true,
      virtual_text = false,
    })
    vim.notify("Diagnostic mode: virtual_lines", vim.log.levels.INFO)
  end
end

vim.keymap.set("n", "<leader>dgt", toggle_diagnostics_style, { desc = "Toggle Diagnostic Style" })

