if exists("g:loaded_latexsymbols")
   finish
endif
let g:loaded_latexsymbols = 1
let s:save_cpo = &cpo
set cpo&vim

let g:symbols_unite_source = {
  \ 'name': 'latexsymbols',
  \ 'description': 'latexsymbols',
  \ 'action_table': {
  \   'insert_symbol': {
  \     'description': 'insert_latexsymbol'
  \   }
  \ }, 
  \ 'default_action':'insert_latexsymbol'
  \ }

function! g:latexsymbols_unite_source.action_table.insert_latexsymbol.func(candidate)
  execute "normal i " . a:candidate.action__tex
endfunction

function! g:latexsymbols_unite_source.gather_candidates(args, context)
  return g:latexsymbols
endfunction

function! g:unite#sources#latexsymbols#define()
  return g:latexsymbols_unite_source
endfunction

call unite#define_source(g:latexsymbols_unite_source)

let &cpo = s:save_cpo

