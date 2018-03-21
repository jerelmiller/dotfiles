if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif

for config_file in split(glob('~/.config/nvim/settings/*'), '\n')
  if filereadable(config_file)
    execute 'source' config_file
  endif
endfor

command! Q q
command! W w
command! Wq wq
command! Qa qa

" Use 0 to go to first character instead of beginning of line
nnoremap 0 ^

" Use ctrl-h/j/k/l to move between splits
nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

inoremap jk <esc>
inoremap Jk <esc>

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>vi :sp $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>ch :silent noh<cr>

" replace word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

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

