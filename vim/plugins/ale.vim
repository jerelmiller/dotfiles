let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = "🔥"
let g:ale_sign_warning = "⚠️"
let g:airline_section_error = '%{ALEGetStatusLine()}'

" ft=vim
