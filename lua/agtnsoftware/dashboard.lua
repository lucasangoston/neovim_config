require('lazy').setup({
    -- Add dashboard-nvim plugin
    {
        'glepnir/dashboard-nvim',
        config = function()
            -- Set the default executive for dashboard
            vim.g.dashboard_default_executive = 'telescope'

            -- Set custom header
            -- Set custom sections
            vim.g.dashboard_custom_section = {
                a = { description = {'  New File          '}, command = 'DashboardNewFile' },
                b = { description = {'  Find File         '}, command = 'Telescope find_files' },
                c = { description = {'  Recent Files      '}, command = 'Telescope oldfiles' },
                d = { description = {'  Find Word         '}, command = 'Telescope live_grep' },
                e = { description = {'  Quit              '}, command = 'qa' },
            }
        end,
    },
})

-- Ensure you have telescope installed if you are using it
require('lazy').setup({
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
})

