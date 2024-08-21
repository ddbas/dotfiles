return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      dockerfile = true,
      groovy = true,
      javascript = true,
      markdown = true,
      rust = true,
      sh = true,
      typescript = true,
      ["."] = false
    }
  end,
}
