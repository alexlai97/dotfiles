local wk = require("which-key")

--{{{ normal mode
wk.register({
    [";"] = {":", ":"}, -- ";" has one less stroke than ":" 
    ["<leader>"] = {
        --{{{ <leader>f "+file"
        f = {
            name = "+file",
            f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
            r = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Open Recent Files" },
        },
        --}}}
        --{{{ <leader>b "+buffer"
        b = {
            name = "+buffer",
            p = { ":bprevious<CR>", "Switch to previous buffer"},
            n = { ":bnext<CR>", "Switch to next buffer"},
            l = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "switch buffer"},
            s = { ":source %<CR>", "Source current lua/vim file"}
        },
        --}}}
        --{{{ <leader>o "+open"
        o = {
            name = "+open",
            p = {"<cmd>lua require 'nvim-tree'.toggle()<CR>", "Toggle nvim-tree (project sidebar)"},
            P = {":NvimTreeFindFile<CR>", "Find file in nvim-tree (project sidebar)"},
            ['-'] = { "<cmd>lua require('telescope.builtin').file_browser()<CR>", "File Browser in Telescope" },
            t = {":vsplit term://fish<CR>", "Open terminal"},
            T = {":TagbarToggle<CR>", "Toggle Tagbar"},
        },
        --}}}
        --{{{ <leader>h "+help/hunk"
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
        --}}}
        --{{{ <leader>g "+git"
        g = {
            name = "+git",
            g = {":Neogit<CR>", "NeogitStatus"},
            b = {"<cmd>lua require('telescope.builtin').git_branches()<CR>", "Show branches"},
        },
        --}}}
        --{{{ <leader>c "+code"
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
        --}}}
        --{{{ <leader>s "+session/startify"
        s = {
            name = "+session/startify",
            t = { ":Startify<CR>", "Open Startify buffer"},
            s = { ":SSave<CR>", "Save a session"},
            d = { ":SDelete<CR>", "Delete a session"},
            l = { ":SLoad<CR>", "Load a session"},
            c = { ":SClose<CR>", "Save and close current session"},
        },
        --}}}
        --{{{ <leader>S "+Simplenote"
        S = {
            name = "+Simplenote",
            l = { ":SimplenoteList<CR>", "List notes" },
            u = { ":SimplenoteUpdate<CR>", "Update this note" },
            d = { ":SimplenoteDelete<CR>", "Completely delete this note" },
            n = { ":SimplenoteNew<CR>", "Create a note from this buffer" },
            p = { ":SimplenotePin<CR>", "Pin this note" },
            P = { ":SimplenoteUnpin<CR>", "Unpin this note" },
            g = { ":SimplenoteGo<CR>", "Go to the linked note" },
        },
        --}}}
        --{{{ <leader>q "+quit/session"
        q = {
            name = "+quit/session",
            Q = {":qa!<CR>", "quit nvim without saving"},
            q = {":wqa<CR>", "quit nvim after saving"},
        },
        --}}}
        --{{{ <leader>[c] single char shortcuts
        ["."] = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
        ["/"] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live grep at current directory" },
        ["~"] = { ":messages<CR>", "See messages" },
        -- ["<"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "switch buffer"},
        --}}} 
    },


    ["<localleader>"] = {
        --{{{ <localleader>cd "+cd change directory"
        ["cd"] = {
            name = "+cd change directory",
            d = { ":cd %:p:h<CR>", "cd for the environment" },
            l = { ":lcd %:p:h<CR>", "cd for current window" },
            t = { ":tcd %:p:h<CR>", "cd for current tab and window" },
        },
        --}}}
        --{{{ <localleader>rc "+rc edit misc config files"
        ["rc"] = {
            name = "+rc edit misc config files",
            t = {":edit ~/.tmux.conf<cr>", "tmux.conf"}, 
            n = {
                name = "+nvim",
                i = {":edit ~/.config/nvim/init.lua<cr>", "init.lua"},
                p = {":edit ~/.config/nvim/lua/plugins.lua<cr>", "lua/plugins.lua"},
                k = {":edit ~/.config/nvim/lua/keybindings.lua<cr>", "lua/keybinding.lua"},
                g = {":edit ~/.config/nvim/lua/general.lua<cr>", "lua/general.lua"},
            }, 
            a = {":edit ~/.config/alacritty/alacritty.yml<cr>", "alacritty/alacritty.yml"}, 
            A = {
                name = "+awesome",
                c = {":edit ~/.config/awesome/rc.lua<cr>", "rc.lua"}, 
                s = {":edit ~/.config/awesome/autostart.lua<cr>", "autostart.lua"}, 
                v = {":edit ~/.config/awesome/variables.lua<cr>", "variables.lua"}, 
                r = {":edit ~/.config/awesome/rules.lua<cr>", "rules.lua"}, 
                m = {":edit ~/.config/awesome/start_menu.lua<cr>", "start_menu.lua"}, 
                b = {":edit ~/.config/awesome/wibar.lua<cr>", "wibar.lua"}, 
                k = {":edit ~/.config/awesome/keybindings.lua<cr>", "keybinding.lua"}, 
            },
            f = {":edit ~/.config/fish/config.fish<cr>", "fish/config.fish"}, 
        },
        --}}}
    },

    --{{{ move line up/down
    ["<A-j>"] = { ":m .+1<CR>==", "move current line down"},
    ["<A-k>"] = { ":m .-2<CR>==", "move current line up"},
    --}}}

    --{{{ buffer next/prev
    ["[b"] = { ":bprevious<CR>", "Switch to previous buffer"},
    ["]b"] = { ":bnext<CR>", "Switch to next buffer"},
    --}}}

    --{{{ quickfix move to next/prev/first/last entry
    ["[q"] =  { ":cprevious<cr>", "quickfix previous"},
    ["]q"] =  { ":cnext<cr>", "quickfix next"}    ,
    ["[Q"] =  { ":cfirst<cr>", "quickfix first"}    ,
    ["]Q"] =  { ":clast<cr>", "quickfix last"}     ,
    --}}}

    --{{{ gitsigns move to next/previous hunk
    ["[c"] =  { "(gitsigns) previous diff hunk" },
    ["]c"] =  { "(gitsigns) next diff hunk" },
    --}}}

    --{{{ <F3> toggle nvim-tree 
    ["<F3>"] = {"<cmd>lua require 'nvim-tree'.toggle()<CR>", "Toggle nvim-tree"},
    --}}}
    
    --{{{ <F3> toggle nvim-tree 
    ["<F8>"] = {":TagbarToggle<CR>", "Toggle Tagbar"},
    --}}}

    --{{{ LSP hover/signature_help/diagnostic_prev/next
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover doc"},
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Display signature info about the symbol"},
    ["[d"] = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Move to previous diagnostic"},
    ["]d"] = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Move to next diagnostic"},
    --}}} 

    --{{{ gnn start treesitter incremental selection 
    ["gnn"] = { "(treesitter) start incremental selection"},
    --}}}
},

    -- Options
    {mode = "n", silent = false, noremap = true}
)
--}}}

--{{{ visual mode 
wk.register({
    [";"] = {":", ":"}, -- ";" has one less stroke than ":" 
    --{{{ gr  Treesitter incremental selection
    ["gr"] = {
        name = "+treesitter",
            n = { "increment to upper named parent"},
            m = { "decrement to previous named node"},
            c = { "increment to upper scope"},
    },
    --}}}

    --{{{ move lines up/down 
    ["<A-j>"] = { ":m \'>+1<CR>gv=gv", "move lines down"},
    ["<A-k>"] = { ":m \'<-2<CR>gv=gv", "move lines up"},
    --}}} 
},
    -- Options
    {mode = "v", silent = false, noremap = true}
)
--}}}

--{{{ insert mode 
wk.register({
    --{{{move current line up/down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move current line down"},
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move current line up"},
    --}}}
},
    -- Options
    {mode = "i", silent = false, noremap = true}
)
--}}}

-- Commands {{{
-- FIXME add c tabshift in filetype/c.vim
vim.cmd[[ command! Format execute 'lua vim.lsp.buf.formatting()']]
-- }}}
