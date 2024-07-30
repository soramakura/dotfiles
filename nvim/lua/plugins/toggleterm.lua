return {{
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm' },
    opts = {
        size = 30,
        direction = 'horizontal',
        autochdir = true,
    },
    config = function(_, opts)
        require('toggleterm').setup(opts)

        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
            cmd = 'lazygit',
            direction = 'float',
            hidden = true,
        })
        function _lazygit_toggle()
            lazygit:toggle()
        end
    end,
}}
