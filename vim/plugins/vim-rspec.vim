autocmd FileType ruby nnoremap <leader>cs :call RunCurrentSpecFile()<CR>
autocmd FileType ruby nnoremap <leader>ns :call RunNearestSpec()<CR>
autocmd FileType ruby nnoremap <leader>ls :call RunLastSpec()<CR>
autocmd FileType ruby nnoremap <leader>as :call RunAllSpecs()<CR>

let g:rspec_command = '!rspec {spec}'

" vim:ft=vim
