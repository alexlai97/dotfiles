--{{{ Window movement keybinding
--[[ vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = true, silent = true}) ]]
--}}}

local wk = require("which-key")

--{{{ normal mode
wk.register({
    ["<leader>"] = {
        f = {
            name = "+file",
            f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
            r = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Open Recent Files" },
            b = { "<cmd>lua require('telescope.builtin').file_browser()<CR>", "File Browser in Telescope" },
        },
        b = {
            name = "+buffer",
            p = { ":bprevious<CR>", "Switch to previous buffer"},
            n = { ":bnext<CR>", "Switch to next buffer"},
            l = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "switch buffer"},
            s = { ":source %<CR>", "Source current lua/vim file"}
        },
        t = {
            name = "+toggle",
            t = {"<cmd>lua require 'nvim-tree'.toggle()<CR>", "Toggle nvim-tree"},
        
        },
        h = {
            name = "+help/hunk",
            c = {"<cmd>lua require('telescope.builtin').commands()<CR>", "Commands"},
            k = {"<cmd>lua require('telescope.builtin').keymaps()<CR>", "Keymaps"},
            h = {"<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help Tags"},
            s = {"(gitsigns) hunk stage"},
            S = {"(gitsigns) buffer stage"},
            u = {"(gitsigns) hunk stage undo"},
            U = {"(gitsigns) reset buffer index"},
            p = {"(gitsigns) hunk preview"},
            r = {"(gitsigns) hunk reset"},
            R = {"(gitsigns) buffer reset"},
            b = {"(gitsigns) blame line"},
        },
        g = {
            name = "+git",
            g = {":Neogit<CR>", "NeogitStatus"},
            b = {"<cmd>lua require('telescope.builtin').git_branches()<CR>", "Show branches"},
        },
        c = {
            name = "+code",
            D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration"},
            d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition"},
            t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Jump to type definition"},
            -- r = {"<cmd>lua vim.lsp.buf.references()<CR>", "List all references"},
            r = {"<cmd>lua require('telescope.builtin').lsp_references()<CR>", "List all references for word"},
            R = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename all references of the symbol"},
            a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Select a code action"},
            i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "List implementations"},
            s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "List implementations"},
        },
        S = {
            name = "+Simplenote",
            l = { ":SimplenoteList<CR>", "List notes" },
            u = { ":SimplenoteUpdate<CR>", "Update this note" },
            t = { ":SimplenoteTrash<CR>", "Trash this note" },
            d = { ":SimplenoteDelete<CR>", "Completely delete this note" },
            n = { ":SimplenoteNew<CR>", "Create a note from this buffer" },
            t = { ":SimplenoteTag<CR>", "Tag this note" },
            t = { ":SimplenoteTag<CR>", "Tag this note" },
            p = { ":SimplenotePin<CR>", "Pin this note" },
            P = { ":SimplenotePin<CR>", "Unpin this note" },
            g = { ":SimplenoteGo<CR>", "Go to the linked note" },
        },
    },

    -- misc
    ["<leader>."] = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
    ["<leader>/"] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live grep at current directory" },
    -- ["<leader><"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "switch buffer"},

    -- change directory
    ["<localleader>cd"] = {
        name = "+cd",
        d = { ":cd %:p:h<CR>", "cd" },
        l = { ":lcd %:p:h<CR>", "cd for current window" },
        t = { ":tcd %:p:h<CR>", "cd for current tab and window" },
    },

    -- edit rc (config) files
    ["<localleader>rc"] = {
        name = "+rc edit",
        t = {":edit ~/.tmux.conf<cr>", "tmux.conf"}, 
        n = {":edit ~/.config/nvim/init.lua<cr>", "nvim/init.lua"}, 
        a = {":edit ~/.config/alacritty/alacritty.yml<cr>", "alacritty/alacritty.yml"}, 
        k = {":edit ~/.config/awesome/keybindings.lua<cr>", "awesome/keybinding.lua"}, 
        f = {":edit ~/.config/fish/config.fish<cr>", "fish/config.fish"}, 
    },

    -- move line shortcuts
    ["<A-j>"] = { ":m .+1<CR>==", "move current line down"},
    ["<A-k>"] = { ":m .-2<CR>==", "move current line up"},

    -- switch buffer
    ["[b"] = { ":bprevious<CR>", "Switch to previous buffer"},
    ["]b"] = { ":bnext<CR>", "Switch to next buffer"},

    -- quickfix shortcuts
    ["[q"] =  { ":cprevious<cr>", "quickfix previous"},
    ["]q"] =  { ":cnext<cr>", "quickfix next"}    ,
    ["[Q"] =  { ":cfirst<cr>", "quickfix first"}    ,
    ["]Q"] =  { ":clast<cr>", "quickfix last"}     ,

    -- gitsigns hunk stuff
    ["[c"] =  { "(gitsigns) previous diff hunk" },
    ["]c"] =  { "(gitsigns) next diff hunk" },

    -- toggle nvim-tree
    ["<F3>"] = {"<cmd>lua require 'nvim-tree'.toggle()<CR>", "Toggle nvim-tree"},

    -- LSP stuff
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover doc"},
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Display signature info about the symbol"},
    ["[d"] = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Move to previous diagnostic"},
    ["]d"] = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Move to next diagnostic"},

    -- Treesitter
    ["gnn"] = { "(treesitter) start incremental selection"},
},

    -- Options
    {mode = "n", silent = false, noremap = true}
)
--}}}

--{{{ visual mode 
wk.register({
    ["gr"] = {
        name = "+treesitter",
            n = { "increment to upper named parent"},
            m = { "decrement to previous named node"},
            c = { "increment to upper scope"},
    },

    -- move line shortcuts
    ["<A-j>"] = { ":m \'>+1<CR>gv=gv", "move current line down"},
    ["<A-k>"] = { ":m \'<-2<CR>gv=gv", "move current line up"},
},
    {mode = "v", silent = false, noremap = true}
)
--}}}

--{{{ insert mode 
wk.register({
    -- move line shortcuts
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move current line down"},
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move current line up"},
},
    {mode = "i", silent = false, noremap = true}
)
--}}}

-- Commands {{{
-- FIXME add c tabshift in filetype/c.vim
vim.cmd[[ command! Format execute 'lua vim.lsp.buf.formatting()']]
-- }}}
