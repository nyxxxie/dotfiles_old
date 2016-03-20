" Author: Sasha
" I stole this theme config file style from the them located at
" https://github.com/Lokaltog/vim-distinguished.  Also, this theme 
" has not been tested with gvim (it will probably look like shit)

" Initialization {{{
set background=dark
set cursorline

hi clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'classified'

if ! has('gui_running')
    if &t_Co != 256
        echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'

        finish
    endif
endif
" }}}
" Color dictionary parser {{{
function! s:ColorDictParser(color_dict)
    for [group, group_colors] in items(a:color_dict)
        exec 'hi ' . group
            \ . ' ctermfg=' . (group_colors[0] == '' ? 'NONE' :       group_colors[0])
            \ . ' ctermbg=' . (group_colors[1] == '' ? 'NONE' :       group_colors[1])
            \ . '   cterm=' . (group_colors[2] == '' ? 'NONE' :       group_colors[2])
            \
            \ . '   guifg=' . (group_colors[3] == '' ? 'NONE' : '#' . group_colors[3])
            \ . '   guibg=' . (group_colors[4] == '' ? 'NONE' : '#' . group_colors[4])
            \ . '     gui=' . (group_colors[5] == '' ? 'NONE' :       group_colors[5])
    endfor
endfunction
" }}}

"     | Highlight group                  | CTFG  | CTBG  | CTAttributes    | || | GUIFG   | GUIBG    | GUIAttributes   |
"     |----------------------------------|-------|-------|-----------------| || |---------|----------|-----------------|
call s:ColorDictParser({
    \   'Normal'                      : [      7,     '',               '',      'ffffff',  '000000',               '']
    \ , 'Visual'                      : [     '',      7,               '',      '585858',  'dadada',               '']
    \ , 'Flash'                       : [      7,      1,               '',      '585858',  'dadada',               '']
    \
    \ , 'Cursor'                      : [     '',     '',               '',      'ffffff',  'dd4010',               '']
    \ , 'lCursor'                     : [     '',     '',               '',      'ffffff',  '89b6e2',               '']
    \
    \ , 'CursorLine'                  : [     '',     "",               '',            '',  '3a3a3a',               '']
    \ , 'CursorLineNr'                : [      5,    234,               '',      'ffffff',  '585858',               '']
    \ , 'CursorColumn'                : [     '',    234,               '',      'ffffff',  '3a3a3a',               '']
    \
    \ , 'Folded'                      : [     '',     '',               '',      'b2b2b2',  '1c1c1c',               '']
    \ , 'FoldColumn'                  : [     '',     '',               '',      '767676',  '1c1c1c',               '']
    \ , 'SignColumn'                  : [    238,    234,           'bold',      'ffffff',  '121212',           'bold']
    \ , 'ColorColumn'                 : [    238,    234,               '',            '',  '262626',               '']
    \
    \ , 'StatusLine'                  : [    238,    234,           'bold',      'ffffff',  '303030',           'bold']
    \ , 'StatusLineNC'                : [     '',     '',               '',      '808080',  '080808',               '']
    \
    \ , 'LineNr'                      : [    238,    234,               '',      '767676',  '262626',               '']
    \ , 'VertSplit'                   : [    238,     '',               '',      '585858',  '1c1c1c',               '']
    \
    \ , 'WildMenu'                    : [      5,    234,               '',      '1c1c1c',  'ffffff',               '']
    \ , 'Directory'                   : [      4,     '',           'bold',      'afaf5f',        '',           'bold']
    \
    \ , 'Question'                    : [      2,     '',           'bold',      '5fafd7',        '',           'bold']
    \ , 'MoreMsg'                     : [     '',     '',           'bold',      'ffaf00',        '',           'bold']
    \ , 'WarningMsg'                  : [     '',     '',           'bold',      'ff5f00',        '',           'bold']
    \ , 'ErrorMsg'                    : [     '',     '',           'bold',      'ff0000',        '',           'bold']
    \
    \ , 'Comment'                     : [    240,     '',               '',      '767676',  '121212',               '']
    \ , 'vimCommentTitleLeader'       : [     '',     '',               '',      'bcbcbc',  '121212',               '']
    \ , 'vimCommentTitle'             : [     '',     '',               '',      'bcbcbc',  '121212',               '']
    \ , 'vimCommentString'            : [     '',     '',               '',      '8a8a8a',  '121212',               '']
    \
    \ , 'TabLine'                     : [     '',     '',               '',      'ffffff',  '444444',               '']
    \ , 'TabLineSel'                  : [     '',     '',           'bold',      'eeeeee',        '',           'bold']
    \ , 'TabLineFill'                 : [     '',     '',               '',      '585858',  '444444',               '']
    \ , 'TabLineNumber'               : [     '',     '',           'bold',      'd70000',  '444444',           'bold']
    \ , 'TabLineClose'                : [     '',     '',           'bold',      '8a8a8a',  '444444',           'bold']
    \
    \ , 'SpellCap'                    : [     '',     '',           'bold',      'ffffff',  '0087af',           'bold']
    \
    \ , 'SpecialKey'                  : [    196,     '',               '',      '4e4e4e',        '',               '']
    \ , 'NonText'                     : [      4,     '',               '',      '870000',        '',               '']
    \ , 'MatchParen'                  : [     '',     '',           'bold',      'ffffff',  '005faf',           'bold']
    \
    \ , 'Constant'                    : [      5,     '',           'bold',      'af875f',        '',           'bold']
    \ , 'Special'                     : [      4,     '',               '',      'afd787',        '',               '']
    \ , 'Identifier'                  : [      2,     '',           'bold',      '5f8787',        '',           'bold']
    \ , 'Statement'                   : [      5,     '',           'bold',      'd7d787',        '',           'bold']
    \ , 'PreProc'                     : [      8,     '',               '',      '9e9e9e',        '',               '']
    \ , 'Type'                        : [      6,     '',           'bold',      '5f87af',        '',           'bold']
    \ , 'String'                      : [      1,     '',               '',      'afaf5f',        '',               '']
    \ , 'Number'                      : [      1,     '',               '',      'd7875f',        '',               '']
    \ , 'Define'                      : [      8,     '',               '',      'd7875f',        '',               '']
    \ , 'Error'                       : [     88,     '',               '',      'ff8700',  'af0000',               '']
    \ , 'Function'                    : [      3,     '',               '',      'd7af5f',        '',               '']
    \ , 'Include'                     : [      8,     '',               '',      'd7875f',        '',               '']
    \ , 'PreCondit'                   : [     51,     '',               '',      'd7875f',        '',               '']
    \ , 'Keyword'                     : [      8,     '',               '',      'd7875f',        '',               '']
    \ , 'Search'                      : [    137,     '',               '',      '000000',  'ffff5f', 'underline,bold']
    \ , 'Title'                       : [     '',     '',               '',      'ffffff',        '',               '']
    \ , 'Delimiter'                   : [    160,     '',               '',      '949494',        '',               '']
    \ , 'StorageClass'                : [      6,     '',               '',      'd7d7af',        '',               '']
    \ , 'Operator'                    : [     '',     '',               '',      'd7af87',        '',               '']
    \
    \ , 'TODO'                        : [     10,     '',           'bold',      'ffff87',  '875f00',           'bold']
    \
    \ , 'Pmenu'                       : [    238,    234,               '',      'a8a8a8',  '585858',               '']
    \ , 'PmenuSel'                    : [      5,    234,               '',      'dadada',  '8a8a8a',               '']
    \ , 'PmenuSbar'                   : [     '',     '',               '',      'dadada',  'a8a8a8',               '']
    \
    \ , 'phpEOL'                      : [     '',     '',               '',      'dadada',        '',               '']
    \ , 'phpStringDelim'              : [     '',     '',               '',      '875f00',        '',               '']
    \ , 'phpDelimiter'                : [     '',     '',               '',      'd70000',        '',               '']
    \ , 'phpFunctions'                : [     '',     '',           'bold',      'ffd75f',        '',           'bold']
    \ , 'phpBoolean'                  : [     '',     '',           'bold',      'd78700',        '',           'bold']
    \ , 'phpOperator'                 : [     '',     '',               '',      'ffaf5f',        '',               '']
    \ , 'phpMemberSelector'           : [     '',     '',           'bold',      'af8787',        '',           'bold']
    \ , 'phpParent'                   : [     '',     '',               '',      'ffff5f',        '',               '']
    \
    \ , 'PHPClassTag'                 : [     '',     '',               '',      'dadada',        '',               '']
    \ , 'PHPInterfaceTag'             : [     '',     '',               '',      'dadada',        '',               '']
    \ , 'PHPFunctionTag'              : [     '',     '',           'bold',      'ffd787',        '',           'bold']
    \
    \ , 'pythonDocString'             : [     '',     '',               '',      '585858',  '121212',               '']
    \ , 'pythonDocStringTitle'        : [     '',     '',               '',      'dadada',  '121212',               '']
    \ , 'pythonRun'                   : [     '',     '',               '',      '5f875f',        '',               '']
    \ , 'pythonBuiltinObj'            : [     '',     '',           'bold',      '5f87af',        '',           'bold']
    \ , 'pythonSelf'                  : [     '',     '',           'bold',      'bcbcbc',        '',           'bold']
    \ , 'pythonFunction'              : [     '',     '',           'bold',      'd7af5f',        '',           'bold']
    \ , 'pythonClass'                 : [     '',     '',           'bold',      'ffd75f',        '',           'bold']
    \ , 'pythonExClass'               : [     '',     '',               '',      'af5f00',        '',               '']
    \ , 'pythonException'             : [     '',     '',           'bold',      'af5f00',        '',           'bold']
    \ , 'pythonOperator'              : [     '',     '',               '',      'd7d787',        '',               '']
    \ , 'pythonPreCondit'             : [     '',     '',           'bold',      'afd7d7',        '',           'bold']
    \ , 'pythonDottedName'            : [     '',     '',               '',      'd75f00',        '',               '']
    \ , 'pythonDecorator'             : [     '',     '',           'bold',      'af0000',        '',           'bold']
    \
    \ , 'PythonInterfaceTag'          : [     '',     '',               '',      '87afaf',        '',               '']
    \ , 'PythonClassTag'              : [     '',     '',               '',      'ffd75f',        '',               '']
    \ , 'PythonFunctionTag'           : [     '',     '',               '',      '87afaf',        '',               '']
    \ , 'PythonVariableTag'           : [     '',     '',               '',      'dadada',        '',               '']
    \ , 'PythonMemberTag'             : [     '',     '',               '',      'afafaf',        '',               '']
    \
    \ , 'CTagsImport'                 : [     '',     '',               '',      '87afaf',        '',               '']
    \ , 'CTagsClass'                  : [     '',     '',               '',      'ffd75f',        '',               '']
    \ , 'CTagsFunction'               : [     '',     '',               '',      '87afaf',        '',               '']
    \ , 'CTagsGlobalVariable'         : [     '',     '',               '',      'dadada',        '',               '']
    \ , 'CTagsMember'                 : [     '',     '',               '',      'afafaf',        '',               '']
    \
    \ , 'xmlTag'                      : [     '',     '',           'bold',      'afd75f',        '',           'bold']
    \ , 'xmlTagName'                  : [     '',     '',               '',      'bcbcbc',        '',               '']
    \ , 'xmlEndTag'                   : [     '',     '',           'bold',      'ff875f',        '',           'bold']
    \
    \ , 'cssImportant'                : [     '',     '',           'bold',      'd75f00',        '',           'bold']
    \
    \ , 'DiffAdd'                     : [     '',     '',               '',      '87d700',  '005f00',               '']
    \ , 'DiffChange'                  : [     '',     '',               '',      'ffd700',  '875f00',               '']
    \ , 'DiffDelete'                  : [     '',     '',               '',      'd70000',        '',               '']
    \ , 'DiffText'                    : [     '',     '',   'reverse,bold',      'ffd700',  '875f00',   'reverse,bold']
    \
    \ , 'diffLine'                    : [     '',     '',           'bold',      '5f87d7',        '',           'bold']
    \ , 'diffFile'                    : [     '',     '',               '',      '6c6c6c',        '',               '']
    \ , 'diffNewFile'                 : [     '',     '',               '',      '6c6c6c',        '',               '']
\ })

hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete
