" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "komodo"

hi Normal guifg=#000000 ctermfg=1 guibg=#FFFFFF ctermbg=7
" red php opening & closing tags
hi Delimiter guifg=#FF0000 ctermfg=1 guibg=#FFFFFF ctermbg=7 gui=NONE
" objects method
hi phpMethodsVar guifg=#339999 ctermfg=3 guibg=#FFFFFF ctermbg=7 gui=NONE
hi phpSpecialFunction guifg=#339999 ctermfg=3 guibg=#FFFFFF ctermbg=7 gui=NONE
" $ sign
hi phpVarSelector guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=7 gui=NONE
" operators * - + = 
hi phpOperator guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=7 gui=NONE
" variable name
hi phpIdentifier guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=7 gui=NONE 
" ()
hi phpParent guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=7 gui=NONE
" single quotes
hi phpStringSingle guifg=#23238e ctermfg=18 guibg=#FFFFFF ctermbg=7 gui=NONE
hi phpStringDouble guifg=#23238e ctermfg=18 guibg=#FFFFFF ctermbg=7 gui=NONE
" keyword
hi phpDefine guifg=#871f78 ctermfg=90 guibg=#FFFFFF ctermbg=7 gui=NONE 
hi link phpStorageClass phpDefine
hi link phpStructure phpDefine
hi link phpConditional phpDefine
hi link phpStatement phpDefine
hi link phpRepeat phpDefine
hi link phpBoolean phpDefine
hi link phpComparison phpDefine
hi link phpType phpDefine
" class name
hi phpRegion guifg=#339999 ctermfg=66 guibg=#FFFFFF ctermbg=7 gui=NONE
" -> from the object
hi phpMemberSelector guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=7 gui=NONE
hi phpComment guifg=#696969 ctermfg=242 guibg=#FFFFFF ctermbg=7 gui=italic
hi phpNumber guifg=#8b0000 ctermfg=88 guibg=#FFFFFF ctermbg=7 gui=NONE

"Invisible character colors
hi NonText guifg=#DDDDDD
hi SpecialKey guifg=#DDDDDD

