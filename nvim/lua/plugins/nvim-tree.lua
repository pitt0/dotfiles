return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    opts = {
        view = {
            width = 25,
        },
        git = {
            ignore = false,
        }
    },
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function(_, opts)
        local nvimtree = require("nvim-tree");
        nvimtree.setup(opts);

        local keymap = vim.keymap;
        keymap.set('n', "<leader>ee", "<cmd>NvimTreeToggle<cr>");
        keymap.set('n', "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>");
        keymap.set('n', "<leader>ec", "<cmd>NvimTreeCollapse<cr>");
        keymap.set('', "<C-h>", "<cmd>NvimTreeFocus<cr>");
    end,
}
