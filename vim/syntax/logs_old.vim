" Vim syntax file
" Language:         Log files
" Maintainer:       Jim Lawton <jim.lawton@gmail.com>
" Latest Revision:  2008-08-13

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

"syn match   messagesBegin       display '^' nextgroup=messagesDate
"syn match   messagesPID         contained display '\[\zs\d\+\ze\]'
"syn match   messagesKernel      '^kernel:'
"syn match   messagesIP          '\d\+\.\d\+\.\d\+\.\d\+'
"syn match   messagesURL         '\w\+://\S\+'
"syn match   messagesText        contained display '.*'
"                                \ contains=messagesNumber,messagesIP,messagesURL,messagesError

"syn match   messagesNumber      '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'

syn match   messagesFatal       '^.*\<\(FATAL\|FAILED\|FAILURE\).*'
syn match   messagesError       '^.*\<\(ERROR\|ERRORS\).*'
syn match   messagesWarn        '^.*\<\(WARN\).*'
syn match   messagesInfo        '^.*\<\(INFO\).*'
syn match   messagesEnter       '^.*\<\(ENTER\).*'
syn match   messagesExit        '^.*\<\(EXIT\).*'

"hi def link messagesDate        Constant
"hi def link messagesHour        Type
"hi def link messagesHost        Identifier
"hi def link messagesLabel       Operator
"hi def link messagesPID         Constant
"hi def link messagesKernel      Special
hi def link messagesFatal       ErrorMsg
hi def link messagesError       Operator
hi def link messagesWarn        Identifier
hi def link messagesInfo        Keyword
"hi def link messagesIP          Constant
"hi def link messagesURL         Underlined
"hi def link messagesText        Normal
"hi def link messagesNumber      Number
hi def link messagesEnter       Type
hi def link messagesExit        Type

let b:current_syntax = "messages"

let &cpo = s:cpo_save
unlet s:cpo_save
