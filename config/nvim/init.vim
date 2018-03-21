if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif

for config_file in split(glob('~/.config/nvim/settings/**/*'), '\n')
  if filereadable(config_file)
    execute 'source' config_file
  endif
endfor
