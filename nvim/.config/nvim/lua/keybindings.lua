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
            name = "+help",
            c = {"<cmd>lua require('telescope.builtin').commands()<CR>", "Commands"},
            k = {"<cmd>lua require('telescope.builtin').keymaps()<CR>", "Keymaps"},
            h = {"<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help Tags"},
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
        }
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

    -- switch buffer
    ["[b"] = { ":bprevious<CR>", "Switch to previous buffer"},
    ["]b"] = { ":bnext<CR>", "Switch to next buffer"},

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
    }
},
    {mode = "v", silent = false, noremap = true}
)
--}}}

-- Commands {{{
-- FIXME add c tabshift in filetype/c.vim
vim.cmd[[ command! Format execute 'lua vim.lsp.buf.formatting()']]
-- }}}
