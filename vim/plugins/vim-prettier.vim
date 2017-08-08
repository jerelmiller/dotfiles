let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0

let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'none'

autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
