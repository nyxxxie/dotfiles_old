" Navigate splits without using ctrl+w
" nmap <silent> <C-h> :wincmd h<CR>
" nmap <silent> <C-j> :wincmd j<CR>
" nmap <silent> <C-k> :wincmd k<CR>
" nmap <silent> <C-l> :wincmd l<CR>

" Make arrow keys adjust split sizes
nmap <buffer> <silent> <up> :wincmd +<CR>
nmap <buffer> <silent> <down> :wincmd -<CR>
nmap <buffer> <silent> <left> :wincmd <<CR>
nmap <buffer> <silent> <right> :wincmd ><CR>

" Tab and buffer switching
map <silent> <leader>] :bnext<cr>
map <silent> <leader>[ :bprevious<cr>
map <silent> <leader>} :tabn<cr>
map <silent> <leader>{ :tabp<cr>

" Useful for counting multiline operations
nnoremap <leader>r :set relativenumber!<CR>

" Save file as root
cmap w!! w !sudo tee % >/dev/null

" Ignore line indenting and etc, useful for pasting
set pastetoggle=<F2>

" Enable mouse stuff (useful for overviewing a file)
set mouse=a

" Clears search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" Shows highlighting as we are searching
nnoremap <silent> <leader>zz :let &scrolloff=999-&scrolloff<CR>
