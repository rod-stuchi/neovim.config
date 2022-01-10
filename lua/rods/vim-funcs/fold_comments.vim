function! s:fold_comments()
    let &foldexpr='getline(v:lnum)=~''^\s*#\|^\s*\*\|^\s*"\|^\s*//\|^\s*$'''
    set foldmethod=expr foldexpr foldlevel=0
endfunction

command! RodFoldComments call s:fold_comments()
