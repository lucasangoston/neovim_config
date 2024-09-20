
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
