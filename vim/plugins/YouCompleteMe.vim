autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif

let g:ycm_dont_warn_on_startup = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 0

" vim:ft=vim
