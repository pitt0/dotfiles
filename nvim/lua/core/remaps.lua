-- x: visual mode
-- s: select mode
-- v: both the above
-- n: normal mode
-- i: insert mode
vim.g.mapleader = " "

-- normal mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open path view
vim.keymap.set("n", "<leader><leader>", vim.cmd.w) -- save on double space
-- cursor settings
vim.keymap.set("n", "J", "mzJ`z") -- append cursor line to the one above and keep the cursor in place
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- on <C-d> keep the cursor amid the screen
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- on <C-u> keep the cursor amid the screen
vim.keymap.set("n", "n", "nzzzv") -- on next search term, keep the cursor amid the screen
vim.keymap.set("n", "N", "Nzzzv") -- on prev search term, keep the cursor amid the screen
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>") -- edit the word the cursor is on

-- visual/select mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected line(s) up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected line(s) down

-- insert mode
vim.keymap.set("i", "<C-b>", "<ESC>^i") -- goto begginning of line while typing
vim.keymap.set("i", "<C-e>", "<End>") -- got EOL while typing
-- navigate in insert mode
-- vim.keymap.set("i", "<C-h>", "<Left>")
-- vim.keymap.set("i", "<C-j>", "<Down>")
-- vim.keymap.set("i", "<C-k>", "<Up>")
-- vim.keymap.set("i", "<C-l>", "<Righ>")

vim.keymap.set("i", "<C-c>", "<Esc>") -- save changes made in insert when exiting with Ctrl+C

-- visual mode
vim.keymap.set("x", "<leader>p", "\"_dP") -- when highlighting a buffer and pasting anything on it, the clipboard will copy the deleted buffer, this remap makes the buffer remain unchanged

-- copy paste to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- change project
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- delete in void register (won't copy buffer)
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- chmod +x <current file>
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
