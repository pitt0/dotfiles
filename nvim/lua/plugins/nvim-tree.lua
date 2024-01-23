local HEIGHT_RATIO = 0.8;
local WIDTH_RATIO = 0.5;

local function window_size()
    local opt = vim.opt;

    local screen = {
        width = opt.columns:get(),
        height = opt.lines:get() - opt.cmdheight:get(),
    };
    local window = {
        width = screen.width * WIDTH_RATIO,
        height = screen.height * HEIGHT_RATIO,
    };

    return {
        border = "rounded",
        relative = "editor",
        row = (screen.height - window.height) / 2,
        col = (screen.width - window.width) / 2,
        width = math.floor(window.width),
        height = math.floor(window.height)
    };
end

local function window_width()
    return math.floor(vim.opt.columns:get() * WIDTH_RATIO);
end

local function vsplit_open()
    local api = require("nvim-tree.api");
    local node = api.tree.get_node_under_cursor();

    if node.nodes ~= nil then
        api.node.open.edit();
    else
        api.node.open.vertical();
        api.tree.close();
    end
end

local function hsplit_open()
    local api = require("nvim-tree.api");
    local node = api.tree.get_node_under_cursor();

    if node.nodes ~= nil then
        api.node.open.edit();
    else
        api.node.open.horizontal();
        api.tree.close();
    end
end

local function git_add()
    local api = require("nvim-tree.api");
    local node = api.tree.get_node_under_cursor();
    local gs = node.git_status.file;

    -- If the curren node is a directory get children status 
    if gs == nil then
        gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1]) or
             (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
    end

    local status = {
        ["??"] = true,
        ["MM"] = true,
        ["AM"] = true,
        [" M"] = true,
        ["M "] = false,
        ["A "] = false
    };
    -- Stage the node if it is untracked, unstaged or partially staged
    if status[gs] then
        vim.cmd("silent !git add " .. node.absolute_path);
    else
        vim.cmd("silent !git restore --staged" .. node.absolute_path);
    end
    api.tree.reload();
end

return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    opts = {
        view = {
            float = {
                enable = true,
                open_win_config = window_size
            },
            width = window_width,
        },
        git = {
            ignore = false,
        }
    },
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        ["<S-CR>"] = vsplit_open,
    },
    config = function(_, opts)
        local nvimtree = require("nvim-tree");
        nvimtree.setup(opts);

        local keymap = vim.keymap;
        keymap.set('n', "<C-e>", "<cmd>NvimTreeToggle<cr>");
        keymap.set('n', "<S-CR>", vsplit_open);
        keymap.set('n', "<C-CR>", hsplit_open);
        keymap.set('n', "ga", git_add);
    end,
}
