vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- File managing
keymap.set("n", "<leader><leader>", vim.cmd.w) -- save on double space
keymap.set("i", "<C-c>", "<Esc>")              -- save changes made in insert when exiting with Ctrl+C

-- Split window
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>h")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- set windows width equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close window

-- Tabs
keymap.set("n", "<C-t>", ":tabnew<CR>")        -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabnext<CR>")  -- goto next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- goto prev tab

-- Cursor
keymap.set("n", "J", "mzJ`z")       -- append cursor line to the one above and keep the cursor in place
keymap.set("n", "<C-d>", "<C-d>zz") -- on <C-d> keep the cursor amid the screen
keymap.set("n", "<C-u>", "<C-u>zz") -- on <C-u> keep the cursor amid the screen
keymap.set("n", "n", "nzzzv")       -- on next search term, keep the cursor amid the screen
keymap.set("n", "N", "Nzzzv")       -- on prev search term, keep the cursor amid the screen

-- Navigation
keymap.set("i", "<C-b>", "<ESC>^i") -- goto begginning of line while typing
keymap.set("i", "<C-e>", "<End>")   -- got EOL while typing

-- Text editing
keymap.set("n", "<leader>+", "<C-a>")                                          -- increment selected number
keymap.set("n", "<leader>-", "<C-x>")                                          -- decrement selected number
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>") -- edit the word the cursor is on
keymap.set("v", "J", ":m '>+1<CR>gv=gv")                                       -- move selected line(s) up
keymap.set("v", "K", ":m '<-2<CR>gv=gv")                                       -- move selected line(s) down

-- Copy pasting
keymap.set("n", "x", '"_x')   -- on 'x', char buffer will not be saved to clipboard
keymap.set("x", "p", "\"_dP") -- won't copy buffer on paste
-- copy to global clipboard
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")
-- won't copy buffer on delete
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

-- change project
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- NOTE - not working

-- chmod +x <current file>
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
