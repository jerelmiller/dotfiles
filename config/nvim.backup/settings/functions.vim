function! CleanPackages()
  call map(dein#check_clean(), "delete(v:val, 'rf')")
endfunction
