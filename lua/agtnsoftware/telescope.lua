-- config for telescope plugin

local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup{
  defaults = {
   prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

  },
  pickers = {
    find_files = {
      cwd = vim.fn.getcwd(),
    },
    live_grep = {
      cwd = vim.fn.getcwd(),
    },
  },
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


