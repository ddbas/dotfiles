return {
  "neanias/everforest-nvim",
  lazy = true,
  config = function ()
    local everforest = require('everforest')
    everforest.setup({
      background = "medium",
      transparent_background_level = 2,
    })
   everforest.load()
  end
}
