
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

