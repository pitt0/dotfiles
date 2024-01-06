local opt = vim.opt  -- for coniceness

-- Numbers
opt.number = true
opt.relativenumber = true

-- Indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false  -- ??

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- replace swap and backups with undotree
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false  -- removes highlight when closing search
opt.incsearch = true  -- incremental search (searching "/he*o" would not work if false)

opt.termguicolors = true

opt.scrolloff = 10  -- number of lines that remain visible when scrolling

opt.updatetime = 50

opt.colorcolumn = "100"

-- NOTE - netrw may conflict with nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

