if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif

for config_file in split(glob('~/.config/nvim/settings/*'), '\n')
  if filereadable(config_file)
    execute 'source' config_file
  endif
endfor

let g:neoformat_try_formatprg = 1

augroup filetypes
  autocmd!

  autocmd BufNewFile,BufReadPost .eslintrc,.babelrc set filetype=json
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd filetype help call HelpFileMode()

  " Always open quickfix window on bottom
  autocmd FileType qf wincmd J
augroup END

function! HelpFileMode()
  nnoremap <buffer> <cr> <c-]>
  nnoremap <buffer> <bs> <c-T>
  nnoremap <buffer> q :q<cr>
endfunction

