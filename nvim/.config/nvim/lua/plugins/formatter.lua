return {
	"mhartington/formatter.nvim",
	lazy = true,
	enabled = false,
	config = function()
		local formatter = require("formatter")
		local defaults = require("formatter.defaults")
		formatter.setup({
			filetype = {
				css = {
					require("formatter.filetypes.css").prettier,
				},
				html = {
					require("formatter.filetypes.html").prettier,
				},
				javascript = {
					require("formatter.filetypes.javascript").biome,
					require("formatter.filetypes.javascript").prettier,
				},
				javascriptreact = {
					require("formatter.filetypes.javascriptreact").biome,
					require("formatter.filetypes.javascriptreact").prettier,
				},
				json = {
					require("formatter.filetypes.json").biome,
					require("formatter.filetypes.json").prettier,
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				markdown = {
					require("formatter.filetypes.markdown").prettier,
				},
				python = {
					require("formatter.filetypes.python").ruff,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
				typescript = {
					require("formatter.filetypes.typescript").biome,
					require("formatter.filetypes.typescript").prettier,
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").biome,
					require("formatter.filetypes.typescriptreact").prettier,
				},
				xml = {
					require("formatter.filetypes.xml").tidy,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
	cmd = "Format",
}
