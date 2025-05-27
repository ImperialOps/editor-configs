local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pfg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.select_vertical,
      },
      n = {
        ["<C-s>"] = actions.select_vertical,
      }
    },
  }
}
