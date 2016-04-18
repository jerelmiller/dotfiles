let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'
let g:airline_section_x = ''
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'

" vim:ft=vim
