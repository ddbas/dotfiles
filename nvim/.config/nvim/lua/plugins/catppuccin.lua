return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = false,
  lazy = true,
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      transparent_background = true,
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
