return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    opts = {
        view = {
            width = 25,
        },
    },
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function(_, opts)
        require('nvim-tree').setup(opts)
        vim.keymap.set('', "<leader>ee", "<cmd>NvimTreeToggle<cr>")
        vim.keymap.set('', "<C-h>", "<cmd>NvimTreeFocus<cr>")
    end,
}
