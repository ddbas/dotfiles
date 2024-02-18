return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      extensions = {
        file_browser = {
          auto_depth = true,
          grouped = true,
          hidden = true
        }
      }
    })

    vim.api.nvim_set_keymap(
      "n",
      "<space>fb",
      ":Telescope file_browser<CR>",
      { noremap = true }
    )

    -- open file_browser with the path of the current buffer
    vim.api.nvim_set_keymap(
      "n",
      "<space>fB",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { noremap = true }
    )

    require("telescope").load_extension("file_browser")
  end
}
