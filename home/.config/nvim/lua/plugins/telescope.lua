return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  config = function ()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        layout_strategy = 'flex',
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            height = 0.9,
            preview_width = 0.5,
            prompt_position = 'top',
            width = 0.9,
          },
          vertical = {
            height = 0.9,
            preview_height = 0.5,
            prompt_position = 'top',
            width = 0.9,
          },
        },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--iglob',
          '!.git'
        }
      },
      pickers = {
        find_files = {
          find_command = { 'fd', '--hidden', '--color', 'never', '-E', '.git' },
          hidden = true
        },
        live_grep = {
          hidden = true
        }
      },
      extensions = {
          fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case"
          }
      }
    })

    telescope.load_extension("fzf")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fm', builtin.marks, {})
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
    vim.keymap.set('n', 'gr', builtin.lsp_references, {})
    vim.keymap.set('n', 'gs', builtin.lsp_workspace_symbols, {})
  end,
}
