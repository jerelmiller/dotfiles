nnoremap <leader>cs :call RunCurrentSpecFile()<CR>
nnoremap <leader>ns :call RunNearestSpec()<CR>
nnoremap <leader>ls :call RunLastSpec()<CR>
nnoremap <leader>as :call RunAllSpecs()<CR>

let g:rspec_command = '!clear && bin/rspec {spec}'

" vim:ft=vim
