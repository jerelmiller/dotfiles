let g:syntastic_filetype_map = { 'javascript.jsx': 'javascript' }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_warning_symbol = '!'
let g:syntastic_error_symbol = '✗'

nnoremap <leader>l :SyntasticCheck<cr>
nnoremap <leader>lc :lclose<cr>

" vim:ft=vim
