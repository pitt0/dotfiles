return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        vim.keymap.set('n', "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
        vim.keymap.set('n', "<leader>gs", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })<cr>")
    end
}
