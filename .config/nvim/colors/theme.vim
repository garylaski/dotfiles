let g:colors_name='theme'
" foreground
let fg_tan    = ' guifg=#d2b48c'
let fg_yellow = ' guifg=#ffff00'
let fg_gray80 = ' guifg=#bbbbbb'
let fg_red    = ' guifg=#cd5c5c'
let fg_green  = ' guifg=#98fb98'
let fg_white  = ' guifg=#faf0e6'
let fg_blue   = ' guifg=#80dddd'
let fg_bg     = ' guifg=#292929'

" background
let bg      = ' guibg=#292929'
let bg_tan  = ' guibg=#d2b48c'
let bg_none = ' guibg=NONE'
let none    = ' gui=none'
let bold      = ' gui=bold'
let underline = ' gui=underline'
let undercurl = ' gui=undercurl'

execute 'hi Normal'       . fg_tan     . bg_none . none
execute 'hi Comment'      . fg_yellow  . bg_none . none
execute 'hi Todo'         . fg_yellow  . bg_none . bold
execute 'hi String'       . fg_gray80  . bg_none . none
execute 'hi Type'         . fg_green   . bg_none . none
execute 'hi Statement'    . fg_white   . bg_none . none
execute 'hi Error'        . fg_red     . bg_none . bold
execute 'hi Number'       . fg_blue    . bg_none . none
execute 'hi StatusLine'   . fg_bg      . bg_tan  . none

hi! link Operator     Normal
hi! link Identifier   Normal
hi! link PreProc      Normal
hi! link Macro        Normal
hi! link Constant     Type
hi! link Title        Type
hi! link Directory    Type
hi! link Function     Type
hi! link Character    String
hi! link ErrorMsg     Error
hi! link SpecialKey   Comment
