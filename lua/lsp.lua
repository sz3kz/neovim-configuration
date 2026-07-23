-- https://tduyng.com/blog/neovim-lsp-native/

local function augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Code Rename" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover (alt)" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })

-- I use blink.cmp for completion, but you can use native completion too
local completion = vim.g.completion_mode or "blink" -- or 'native' for built-in completion
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup("lsp_attach"),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local buf = args.buf
		if client then
			-- Built-in completion
			if completion == "native" and client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			end

			-- Inlay hints
			if client:supports_method("textDocument/inlayHint") then
				vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
			end

			if vim.lsp.document_color and client:supports_method("textDocument/documentColor") then
				vim.lsp.document_color.enable(true, { bufnr = buf }, {
					style = "virtual",
				})
			end
		end
	end,
})

-- Enable LSP servers for Neovim 0.11+
vim.lsp.enable({
  "basedpyright",
  "clangd",
  "nixd",
  "lua_ls",
})

-- Load Lsp on-demand, e.g: eslint is disable by default
-- e.g: We could enable eslint by set vim.g.lsp_on_demands = {"eslint"}
if vim.g.lsp_on_demands then
	vim.lsp.enable(vim.g.lsp_on_demands)
end
