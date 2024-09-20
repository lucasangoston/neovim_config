require('agtnsoftware.remap')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Completion --
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},

  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'saadparwaiz1/cmp_luasnip'},
  {'L3MON4D3/LuaSnip'},
  {'rafamadriz/friendly-snippets'},

    -- Mason --
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {"neovim/nvim-lspconfig"},

    -- Catppuccin --
  {"catppuccin/nvim", name = "catppuccin", priority = 1000},

    -- Telescope --
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

    -- Tressitter --
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

    -- Harpoon --
  { import = 'agtnsoftware.harpoon' },

    -- Undotree --
  { import = 'agtnsoftware.undotree' },

    -- Fugitive --
  { import = 'agtnsoftware.fugitive' },

   {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
}
}

local opts = {}

require("lazy").setup(plugins, opts)
require('agtnsoftware.lsp')
require('agtnsoftware.cmp')
require('agtnsoftware.reload')
require('agtnsoftware.telescope')
require('agtnsoftware.theme')
require('agtnsoftware.treesitter')
