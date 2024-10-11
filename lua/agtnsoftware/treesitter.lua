local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

require('nvim-treesitter.configs').setup({
    ensure_installed = { "lua", "javascript", "java", "vim", "html", "tsx", "json", "css", "typescript" },
    highlight = { enable = true },
    indent = { enable = true },
    autotag = {
        enable = true,
    },
})
