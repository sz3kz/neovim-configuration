-- https://tduyng.com/blog/neovim-lsp-native/

local function augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.keymap.set("n", "<leader>ls", ":checkhealth vim.lsp<CR>", { desc = "LSP: status" })
vim.keymap.set("n", "<leader>lse", ":lsp enable<CR>", { desc = "LSP: enable" })
vim.keymap.set("n", "<leader>lsd", ":lsp disable<CR>", { desc = "LSP: disable" })
vim.keymap.set("n", "<leader>lss", ":lsp stop<CR>", { desc = "LSP: stop" })
vim.keymap.set("n", "<leader>lsr", ":lsp restart<CR>", { desc = "LSP: stop" })

vim.keymap.set("n", "<leader>lsba", vim.lsp.buf.code_action, { desc = "LSP: code actions" })
vim.keymap.set("n", "<leader>lsbr", vim.lsp.buf.rename, { desc = "LSP: rename" })
vim.keymap.set("n", "<leader>lsbh", vim.lsp.buf.hover, { desc = "LSP: hover" })
vim.keymap.set("n", "<leader>lsbd", vim.lsp.buf.definition, { desc = "LSP: goto definition" })
vim.keymap.set("n", "<leader>dgof", vim.diagnostic.open_float, { desc = "Diagnostics: open float" })

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

-- Load Lsp on-demand, e.g: eslint is disable by default
-- e.g: We could enable eslint by set vim.g.lsp_on_demands = {"eslint"}
if vim.g.lsp_on_demands then
	vim.lsp.enable(vim.g.lsp_on_demands)
end
