return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- TODO: find a way to format with 4 spaces
                -- json = { "jq" },
                python = { "isort", "black" }
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500
            }
        })
    end
}
