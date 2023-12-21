return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
        local lspconfig = require('lspconfig')

        local opts = { noremaps = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show references"
            vim.keymap.set('n', "<lader>gg", "<cmd>Telescope lsp_references<cr>", opts)

            opts.desc = "Goto Definition"
            vim.keymap.set('n', "<leader>df", vim.lsp.buf.declaration, opts)

            opts.desc = "Rename"
            vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, opts)
       end

       local capabilities = require('cmp_nvim_lsp').default_capabilities()

       lspconfig["lua_ls"].setup({
           capabilities = capabilities,
           on_attach = on_attach,
           settings = {
               Lua = {
                   diagnostics = {
                       globals = { "vim" }
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        }
                    }
                }
            }
       })
       lspconfig.rust_analyzer.setup({
           capabilities = capabilities,
           on_attach = on_attach
       })
       lspconfig.asm_lsp.setup({
           capabilities = capabilities,
           on_attach = on_attach
       })
       lspconfig.ocamllsp.setup({
           capabilities = capabilities,
           on_attach = on_attach
       })
   end,
}
