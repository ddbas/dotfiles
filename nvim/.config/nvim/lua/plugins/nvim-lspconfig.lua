return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.keymap.set("n", "<leader>k", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>a", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>r", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float()
		end, opts)

		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#pyright
    vim.lsp.enable('bashls')
		vim.lsp.enable("biome")
		vim.lsp.enable("cssls")
		vim.lsp.enable("eslint")
		vim.lsp.enable("html")
    vim.lsp.enable("jsonls")
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('marksman')
    vim.lsp.enable('rust_analyzer')
    vim.lsp.enable("ts_ls")
	end,
}
