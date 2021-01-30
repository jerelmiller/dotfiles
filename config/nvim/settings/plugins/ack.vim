nnoremap <leader>g :Ack! <cword><cr>
nnoremap <leader>ag :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
