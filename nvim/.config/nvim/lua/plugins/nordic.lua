return {
  "AlexvZyl/nordic.nvim",
  enabled = false,
  lazy = true,
  priority = 1000,
  config = function()
    local nordic = require('nordic')
    nordic.setup({
      transparent = {
        bg = true
      }
    })
    nordic.load()
  end
}
