" Vim syntax file
" Language:         Log files
" Maintainer:       Jim Lawton <jim.lawton@gmail.com>
" Latest Revision:  2008-08-13

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   messages            display '^NDS: \^[^>]*> ' contains=messagesDate,messagesSeverity,messagesComponent,messagesInfo,message nextgroup=messagesDate
syn match   messagesDate        contained display '\^\d\+\.\d\+ ' nextgroup=messagesSeverity
syn match   messagesSeverity    contained display '\![A-Z]* *' contains=messagesFatal,messagesError,messagesWarn,messagesInfo,messagesEnter,messagesExit nextgroup=messagesComponent
syn match   messagesComponent   contained display '-[^ ]* *' contains=wlm nextgroup=messagesStuff
syn match   wlm                 contained display 'WLM_[^ ]*'
syn match   messagesStuff       contained display '<[^>]*> *' contains=messagesFunction
syn match   messagesFunction    contained display 'F:[^@]*'hs=s+2

syn match   messagesFatal       contained display '!FATAL'
syn match   messagesError       contained display '!ERROR'
syn match   messagesWarn        contained display '!WARN'
syn match   messagesInfo        contained display '!INFO'
syn match   messagesEnter       contained display '!ENTER'
syn match   messagesExit        contained display '!EXIT'

hi def link messagesDate        Constant
hi def link messagesSeverity    Special
hi def link messagesComponent   Identifier
hi def link messagesStuff       Normal
hi          messagesFunction    ctermfg=3
hi          wlm                 cterm=bold ctermfg=3
hi def link messagesFatal       ErrorMsg
hi def link messagesError       ErrorMsg
hi def link messagesWarn        Identifier
hi def link messagesEnter       Type
hi def link messagesExit        Type

let b:current_syntax = "messages"

let &cpo = s:cpo_save
unlet s:cpo_save

