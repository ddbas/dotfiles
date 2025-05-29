return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"astro",
				"css",
				"dockerfile",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"rust",
				"terraform",
				"tsx",
				"typescript",
				"vimdoc",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})

		vim.treesitter.language.register("markdown", "mdx")
	end,
}
