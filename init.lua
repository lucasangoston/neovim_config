-- Example settings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.wo.number = true  -- Set line numbers
vim.wo.relativenumber = true  -- Enable relative line numbers
vim.o.tabstop = 4  -- Set tab width
vim.o.shiftwidth = 4  -- Set indentation width
vim.o.expandtab = true  -- Convert tabs to spaces
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"  -- Use the system clipboard
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.scrolloff = 8

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
}

local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "javascript", "java", "vim" },
  highlight = { enable = true },
  indent = { enable = true },
})

require("catppuccin").setup({
  flavour = "mocha", -- ou "frappe", "macchiato", "mocha"
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = { "italic" },
    keywords = { "italic", "bold" },
    functions = { "bold" },
    variables = {},
    sidebars = "dark", -- style for sidebars
    floats = "dark", -- style for floating windows
  },
})

vim.cmd.colorscheme "catppuccin"

require('agtnsoftware.lsp')
require('agtnsoftware.cmp')
require('agtnsoftware.remap')
