" +-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+-+-+
" |P|l|u|g|i|n| |C|o|n|f|i|g|u|r|a|t|i|o|n|s|
" +-+-+-+-+-+-+ +-+-+-+-+-+-+-+-+-+-+-+-+-+-+


"{{{- vim-startify
let g:startify_custom_header = [
      \ '          ____  _             _   _  __       ',
      \ '         / ___|| |_ __ _ _ __| |_(_)/ _|_   _ ',
      \ '         \___ \| __/ _` | ''__| __| | |_| | | |',
      \ '          ___) | || (_| | |  | |_| |  _| |_| |',
      \ '         |____/ \__\__,_|_|   \__|_|_|  \__, |',
      \ '                                        |___/ ',
      \ ]
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_update_oldfiles = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [   'Sessions']       },
      \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
      \ { 'type': 'files',     'header': [   'MRU']            },
      \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
      \ { 'type': 'commands',  'header': [   'Commands']       },
      \ ]
"-}}}

"{{{- rust / racer
let g:rustfmt_autosave = 1
" set hidden
let g:racer_cmd = "/home/alex/.cargo/bin/racer"
let g:racer_experimental_completer = 0
"-}}}

"{{{- vimtex
"let g:vimtex_view_method='zathura'
let g:vimtex_view_general_viewer='/home/alex/.scripts/zathura-open.sh'
"-}}} 

"{{{- Ultisnips
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"-}}}

"{{{- deoplete
"~~~ let g:deoplete#enable_at_startup = 1
"~~~ "call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
"~~~ if !exists('g:deoplete#omni#input_patterns')
"~~~     let g:deoplete#omni#input_patterns = {}
"~~~ endif
"~~~ let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
"-}}}

"{{{- neosnippet
"~~~ imap <c-k>     <Plug>(neosnippet_expand_or_jump)
"~~~ smap <c-k>     <Plug>(neosnippet_expand_or_jump)
"~~~ xmap <c-k>     <Plug>(neosnippet_expand_target)
"~~~ imap <expr><TAB>
"~~~  \ pumvisible() ? "\<C-n>" :
"~~~  \ neosnippet#expandable_or_jumpable() ?
"~~~  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"~~~ smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"~~~  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"~~~ let g:neosnippet#snippets_directory='~/.vim/my-snips'
"-}}}

"{{{- quick-scope
"let g:qs_highlight_on_keys = ['f', 'F']
"-}}}


"{{{- tagbar
let g:tagbar_ctags_bin='/usr/bin/ctags'
"-}}}

"{{{- Neovim Language Client
"~~~ let g:LanguageClient_serverCommands = {
"~~~     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"~~~     \ 'java': ['/usr/bin/jdtls'],
"~~~     \ 'python': ['~/.local/bin/pyls'],
"~~~     \ }
"~~~ let g:LanguageClient_hasSnippetSupport=1
"~~~ let g:LanguageClient_hoverPreview="Auto"
"~~~ let g:LanguageClient_selectionUI="quickfix"
"~~~ let g:LanguageClient_diagnosticsList="Quickfix"
"~~~ set completefunc=LanguageClient#complete
"~~~ set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
"~~~ function LC_maps()
"~~~   if has_key(g:LanguageClient_serverCommands, &filetype)
"~~~     nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
"~~~     nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
"~~~     nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"~~~   endif
"~~~ endfunction
"~~~ autocmd FileType rust call LC_maps()
"-}}}

"{{{- TabNine
"~~~ call deoplete#custom#var('tabnine', {
"~~~ \ 'line_limit': 500,
"~~~ \ 'max_num_results': 20,
"~~~ \ })
"-}}}


"{{{- Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"-}}}
 
 
"{{{- coc snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"-}}}
