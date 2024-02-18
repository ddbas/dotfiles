return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      integrations = {
        cmp = true,
        mason = true,
        native_lsp = {
          enabled = true
        },
        telescope = {
          enabled = true
        },
        treesitter = true
      }
    })
  end
}
