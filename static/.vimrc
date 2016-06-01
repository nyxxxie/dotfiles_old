" Run all files in the config directory
if has("gui_running")
    for f in split(glob('~/.vim/gvimrc.d/*.vim'), '\n')
        exe 'source' f
    endfor
else
    for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
        exe 'source' f
    endfor
endif
