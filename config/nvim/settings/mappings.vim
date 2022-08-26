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
inoremap <C-c> <ESC>

" misc
nnoremap <leader>vi :sp $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>ch :silent noh<cr>
nnoremap <leader>rs :syntax sync fromstart<cr>
nnoremap <leader>p viwp<ESC>b

" vim-plug
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>

" Vimux
nnoremap <leader>vp :VimuxPromptCommand<cr>
nnoremap <leader>vl :VimuxRunLastCommand<cr>
nnoremap <leader>vi :VimuxInspectRunner<cr>
nnoremap <leader>vz :VimuxZoomRunner<cr>
nnoremap <leader>vc :VimuxCloseRunner<cr>

nnoremap <leader>jr :RunJest<cr>
nnoremap <leader>jc :RunJestOnBuffer<cr>
nnoremap <leader>jf :RunJestFocused<cr>

nnoremap <leader>mc :call VimuxRunCommand("clear; mix test " . bufname("%"))<cr>
nnoremap <leader>ml :call VimuxRunCommand("clear; mix test " . bufname("%") . ":" . line("."))<cr>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>t <cmd>Telescope git_files<cr>
nnoremap <leader>t :GFiles --cached --others --exclude-standard<cr>

" vim-fugitive
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>gs :Git<cr>
nnoremap <leader>grm :GRemove<cr>

" replace word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" Use tab for autocompletion
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1): "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Format selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Run :Tsc to populate all typescript errors in the project in a quickfix
" window. Run :copen to view them all
command! -nargs=0 Tsc :call CocAction('runCommand', 'tsserver.watchBuild')

runtime macros/matchit.vim " use % to jump between start/end of methods
