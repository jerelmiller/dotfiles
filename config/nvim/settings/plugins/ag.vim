if executable('ag')
  set grepprg=ag
endif

nnoremap <leader>g :Ag! <cword><cr>
nnoremap <leader>ag :Ag!<Space>
