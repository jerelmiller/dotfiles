" Resync syntax highlighting
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

autocmd BufNewFile,BufReadPost .eslintrc,.babelrc set filetype=json
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
" autocmd BufRead,BufNewFile *.js set filetype=javascriptreact
autocmd filetype help call HelpFileMode()

" Always open quickfix window on bottom
autocmd FileType qf wincmd J

" Add comment syntax for json files
autocmd FileType json syntax match Comment +\/\/.\+$+

function! HelpFileMode()
  nnoremap <buffer> <cr> <c-]>
  nnoremap <buffer> <bs> <c-T>
  nnoremap <buffer> q :q<cr>
endfunction

autocmd BufWritePre *
  \ if !isdirectory(expand("<afile>:p:h")) |
      \ call mkdir(expand("<afile>:p:h"), "p") |
  \ endif

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
