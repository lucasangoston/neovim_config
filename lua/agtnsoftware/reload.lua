local function reload_config()
  -- Sauvegarde tous les buffers
  vim.cmd('wa')
  
  -- Décharge tous les modules Lua chargés
  for name,_ in pairs(package.loaded) do
    if name:match('^user') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end

  -- Recharge le fichier init.lua
  dofile(vim.env.MYVIMRC)
  
  -- Recharge les plugins avec Lazy.nvim
  require("lazy").sync()
  
  -- Rafraîchit l'interface utilisateur
  vim.cmd('redraw')
  print("Configuration rechargée !")
end

-- Définit une commande utilisateur pour recharger la configuration
vim.api.nvim_create_user_command('ReloadConfig', reload_config, {})

-- Optionnel : Ajoute un raccourci clavier pour recharger la configuration
vim.keymap.set('n', '<leader>rr', reload_config, { noremap = true, silent = true, desc = "Recharger la configuration" })
