augroup filetypes
  autocmd!

  autocmd BufNewFile,BufReadPost .eslintrc,.babelrc set filetype=json
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd filetype help call HelpFileMode()

  " Go to variable definition using gb
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

  " Always open quickfix window on bottom
  autocmd FileType qf wincmd J
augroup END

function! HelpFileMode()
  nnoremap <buffer> <cr> <c-]>
  nnoremap <buffer> <bs> <c-T>
  nnoremap <buffer> q :q<cr>
endfunction

function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup Mkdir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
