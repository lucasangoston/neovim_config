-- lua/plugins/undotree.lua
return {
  'mbbill/undotree',
  config = function()
    -- Exemple de mapping de touche pour ouvrir/fermer l'undo tree
    vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
  end,
}

