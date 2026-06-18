return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker"
    },
    config = function()
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = true,
          },
          find_by_full_path_words = true,
          window = {
            mappings = {
              ["<C-f>"] = {
                function(state)
                  require("telescope.builtin").find_files({
                    cwd = state.path,
                    find_command = {
                      "fd",
                      "--type", "f",
                      "--type", "d",
                      "--hidden",
                      "--color", "never",
                      "-E", ".git",
                    },
                  })
                end,
                desc = "Telescope: find files/dirs (respects .gitignore)",
              },
            },
          },
        }
      })
    end
}
