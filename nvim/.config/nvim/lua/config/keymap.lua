-- Formatter
vim.keymap.set("n", "<leader>F", ":Format<CR>")

-- LSP
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) -- Handled by Telescope
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {}) -- Handled by Telescope
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, {}) -- Handled by Telescope
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
vim.keymap.set("i", "<Tab>", function() -- Source: https://neovim.io/doc/user/lsp/#lsp-inline_completion
	if not vim.lsp.inline_completion.get() then
		return "<Tab>"
	end
end, { expr = true, desc = "Accept the current LSP inline completion" })

-- netrw
vim.keymap.set("n", "<leader>pv", ":Neotree<CR>")
