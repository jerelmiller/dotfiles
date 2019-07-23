let g:ale_linters = {
\  'graphql': [],
\  'javascript': ['eslint', 'flow'],
\  'typescript': ['tsserver', 'typescript-eslint-parser']
\}

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'json': ['prettier'],
\  'graphql': ['prettier'],
\  'typescript': ['prettier'],
\  'elixir': ['mix_format'],
\  'scss': ['prettier'],
\  'python': ['black']
\}

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = "⨉"
let g:ale_sign_warning = "⚠"
let g:ale_lint_on_text_changed = 'never'

nnoremap <leader>fix :call FixOnSaveToggle()<cr>

function! FixOnSaveToggle()
  if g:ale_fix_on_save
    let g:ale_fix_on_save = 0
    echo "Fix on save: off"
  else
    let g:ale_fix_on_save = 1
    echo "Fix on save: on"
  endif
endfunction
