" Vim syntax file
" Language:	Log files
" Maintainer:	Jim Lawton (jim.lawton@gmail.com)
" Last change:	August 13, 2008

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif


" shut case off
syn case ignore

"syn match   embraced  "\[[^\]]*\]" contains=ip,time
"syn match   errorlv   "\[error\]\|\[warn\]\|\[notice\]"
syn match   errorlv   "\[error\]\|\[warn\]\|\[notice\]\|\[info\]"
syn match   errorlver "\[error\]"
syn match   time      contained "[^0-9a-z]\([0-9]\{2}:\)\{2}[0-9]\{2}[^0-9a-z]" 
syn match   ip        contained "[^0-9a-z]\([0-9]\{1,3}\.\)\{3}[0-9]\{1,3}[^0-9a-z]"
"syn match   refer     "referer: http://.*"

command -nargs=+ HiLink hi def link <args>

"HiLink embraced   String
HiLink errorlv    Comment 
HiLink errorlver  Error
HiLink time       Identifier
HiLink ip         Special 
"HiLink refer      Keyword 

delcommand HiLink

let b:current_syntax = "logs"

" vim: ts=4 sw=4

