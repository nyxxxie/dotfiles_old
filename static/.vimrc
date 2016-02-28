"+----------: Start up pathogen :---------------------------------------------+
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"+----------: Basic options :-------------------------------------------------+

" What is this 'Vee-Eye' of which you speak
set nocompatible

" Makes it so switching buffers will not require you to save changes
set hidden

" Sexy menu tab completion
set wildmenu
set wildmode=longest:full,full

" Sets <leader> binding
let mapleader="\\"

" Closes preview window
autocmd CompleteDone * pclose

" Set highlighting for searches
set hlsearch

set incsearch

" Copy the indents from the previous line
set autoindent

" Makes the above more similar to the previous
set copyindent

" Save swap files to a much less annoying place.
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=~/.vim/swap//
set directory+=.

" Backup files also are saved in the working dir.
" This changes that too.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir=~/.vim/backup//
set backupdir+=.
set backup

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

" Undofile allows you to save your undo history after exiting
" and restarting.  This enables that option if vim is 7.3+ and
" is compiled with it.  Also makes the files saved in a less
" annoying spot.
" This is only present in 7.3+
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set undodir+=.
  set undofile
endif

" Keeps cursor centered (set to 0 to turn it off)
set scrolloff=9999

" Bigger safety net
set history=1000
set undolevels=1000

" Make splits feel more natural
set splitbelow
set splitright


"+----------: Visual :--------------------------------------------------------+

" Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Change the split character from | to │
set fillchars+=vert:│

" Turns on highlighting
syntax on

" Make n and N highlight search results
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>

function! HLNext(blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('Flash', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" 256 colors
set t_Co=256
if &term =~ '256color'
   set t_ut=
endif

" Set the color scheme
colorscheme digitalforest

" Make tabs less wide and terrible
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Turn on line numbers
set number

"+----------: Basic key binds :-----------------------------------------------+

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

"+----------: Airline settings :----------------------------------------------+

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='digitalforest'


"+----------: YouCompleteMe settings :----------------------------------------+

let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_error_symbol = '>'
let g:ycm_warning_symbol = '!'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


"+----------: Windowswap settings :-------------------------------------------+

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>


"+----------: vim-signature settings :----------------------------------------+

let g:SignatureMartTextHLDynamic = 1
let g:SignatureMarkTextHL = "'CursorLineNr'"


"+----------: Doxygen settings :----------------------------------------------+

let g:DoxygenToolkit_briefTag_pre=""


"+----------: Easytags settings :---------------------------------------------+

" Kill freesing in vim from this plugin
let g:easytags_async = 1

" Set where tags will stored
set tags=./tags;/

"set tags+=tags;$HOME
let g:easytags_dynamic_files = 1
let g:easytags_include_members = 1
highlight link cMember Special
let g:easytags_resolve_links = 1


"+----------: Tagbar settings :----------------------------------------------+

" Toggle the tagbar
nmap <silent> <leader>t :TagbarToggle<CR>


"+----------: Unite.vim settings :--------------------------------------------+

" Open the buffer search menu
nmap <silent> <C-p> :Unite -start-insert file<CR>
nmap <silent> <C-o> :Unite buffer<CR>
nmap <silent> <C-i> :Unite tab<CR>


"+----------: Ultisnips settings :--------------------------------------------+

" How to integrate UltiSnips and YouCompleteMe
"let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Enable tabbing through list of results
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au BufEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
