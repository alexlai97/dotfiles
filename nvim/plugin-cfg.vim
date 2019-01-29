" vim-startify
let g:startify_custom_header = [
      \ '  ____  _             _   _  __       ',
      \ ' / ___|| |_ __ _ _ __| |_(_)/ _|_   _ ',
      \ ' \___ \| __/ _` | ''__| __| | |_| | | |',
      \ '  ___) | || (_| | |  | |_| |  _| |_| |',
      \ ' |____/ \__\__,_|_|   \__|_|_|  \__, |',
      \ '                                |___/ ',
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

" rust
let g:rustfmt_autosave = 1


" Racer 
set hidden
let g:racer_cmd = "/home/alex/.cargo/bin/racer"
let g:racer_experimental_completer = 0

" vimtex
"let g:vimtex_view_method='zathura'
let g:vimtex_view_general_viewer='/home/alex/bin/zathura-open.sh'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Ultisnips
"let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete


" quick-scope
"let g:qs_highlight_on_keys = ['f', 'F']


" tagbar
let g:tagbar_ctags_bin='/usr/bin/ctags'

" Language Client
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'java': ['/usr/bin/jdtls'],
    \ }

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

autocmd FileType rust call LC_maps()
let g:LanguageClient_hasSnippetSupport=0
let g:LanguageClient_hoverPreview="Never"
"set completefunc=LanguageClient#complete
"set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
