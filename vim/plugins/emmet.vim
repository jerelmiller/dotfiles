let g:user_emmet_settings = {
\  'html' : { 'quote_char': "'", },
\  'javascript.jsx': { 'extends': 'jsx', 'quote_char': "'" }
\}

let g:user_emmet_install_global = 0
autocmd FileType html,css,html.handlebars,javascript.jsx EmmetInstall
