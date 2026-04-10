return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--iglob",
          "!.git",
        },
        layout_strategy = 'vertical',
        layout_config = {
          height = 0.95,
          width = 0.95,
        }
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--hidden", "--color", "never", "-E", ".git" },
          hidden = true,
        },
        live_grep = {
          hidden = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    telescope.load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fc", builtin.commands, {})
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>fm", builtin.marks, {})
    vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
    vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
    vim.keymap.set("n", "gr", builtin.lsp_references, {})
    vim.keymap.set("n", "gs", builtin.lsp_document_symbols, {})
    vim.keymap.set("n", "gw", builtin.lsp_workspace_symbols, {})
  end,
}
