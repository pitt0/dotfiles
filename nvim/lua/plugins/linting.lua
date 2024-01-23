return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        require("lint").linters_by_ft = {
            python = { "flake8" }
        }
        local lint = vim.api.nvim_create_augroup("lint", { clear = true });
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint,
            callback = function ()
               require("lint").try_lint();
            end
        })
    end
}
