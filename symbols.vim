if exists("g:loaded_latex_symbols")
   finish
endif
let g:loaded_latex_symbols = 1
let s:save_cpo = &cpo
set cpo&vim

let g:symbols_unite_source = {
  \ 'name': 'latex-symbols',
  \ 'description': 'latex-symbols',
  \ 'action_table': {
  \   'insert_symbol': {
  \     'description': 'insert-latex-symbols'
  \   }
  \ }, 
  \ 'default_action':'insert_symbol'
  \ }

function! g:symbols_unite_source.action_table.insert_symbol.func(candidate)
  execute "normal i " . a:candidate.action__tex
endfunction

function! g:symbols_unite_source.gather_candidates(args, context)
  return g:latex_symbols
"    \ { 'action__tex': '\leq', 'word':'≦', },
"    \ { 'action__tex': '\geq', 'word':'≧', },
"    \ { 'action__tex': '\ll', 'word':'<<', },
"    \ { 'action__tex': '\gg', 'word':'>>', },
"    \ { 'action__tex': '\S', 'word':'§', },
"    \ { 'action__tex': '\P', 'word':'¶', },
"    \ { 'action__tex': '\copyright', 'word':'©', },
"    \ { 'action__tex': '\pm', 'word':'±', },
"    \ { 'action__tex': '\mp', 'word':'∓', },
"    \ { 'action__tex': '\times', 'word':'×', },
"    \ { 'action__tex': '\div', 'word':'÷', },
"    \ { 'action__tex': '\ast', 'word':'*', },
"    \ { 'action__tex': '\star', 'word':'★', },
"    \ { 'action__tex': '\circ', 'word':'○', },
"    \ { 'action__tex': '\bullet', 'word':'●', },
"    \ { 'action__tex': '\cap', 'word':'∩', },
"    \ { 'action__tex': '\cup', 'word':'∪', },
"    \ { 'action__tex': '\vee', 'word':'v', },
"    \ { 'action__tex': '\wedge', 'word':'^', },
"    \ { 'action__tex': '\setminus', 'word':'\', },
"    \ { 'action__tex': '\cdot', 'word':'・', },
"    \ ]
endfunction

function! g:unite#sources#symbols#define()
  return g:symbols_unite_source
endfunction

call unite#define_source(g:symbols_unite_source)

let &cpo = s:save_cpo

