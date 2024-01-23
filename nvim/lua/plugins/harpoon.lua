return {
    "thePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- local harpoon = require("harpoon");
        local mark = require("harpoon.mark");
        local ui = require("harpoon.ui");

        -- harpoon:setup();

        local keymap = vim.keymap; -- for conciseness
        keymap.set("n", "<leader>a", mark.add_file);
        keymap.set("n", "<C-s>", ui.toggle_quick_menu);
    end
}
