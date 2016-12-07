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
endfunction

function! g:unite#sources#symbols#define()
  return g:symbols_unite_source
endfunction

call unite#define_source(g:symbols_unite_source)

let &cpo = s:save_cpo

