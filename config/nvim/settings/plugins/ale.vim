let g:ale_linters = {
\  'javascript': ['eslint', 'flow', 'typescript-eslint-parser']
\}

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'typescript': ['prettier']
\}

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = "⨉"
let g:ale_sign_warning = "⚠"
let g:ale_lint_on_text_changed = 'never'
let g:airline_section_error = '%{ALEGetStatusLine()}'

" ft=vim
