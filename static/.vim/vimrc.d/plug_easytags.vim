" Prevent easytags from making vim freeze in large projects
let g:easytags_async = 1

" Set where tags will stored
set tags=./tags;/

"set tags+=tags;$HOME
let g:easytags_dynamic_files = 1
let g:easytags_include_members = 1
highlight link cMember Special
let g:easytags_resolve_links = 1
