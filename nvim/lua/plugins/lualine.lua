return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', },
    config = function()
        local theme = require("lualine.themes.tokyonight")
        require('lualine').setup({
            options = {
                theme = theme
            }
        })

    end
}
