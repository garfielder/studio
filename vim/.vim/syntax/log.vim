" Vim syntax file
" Language:	ATi log
" Maintainer:	Ginger Luo <ginger.luo@amd.com>
" Last Update:  Tue Nov  4 09:39:40 PST 2007

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

" A bunch of useful keywords
syn keyword logTodo contained TODO

syn match  logTime      "\[dj \d\d:\d\d:\d\d I\]:"
syn match  logTime      "\[dj \d\d:\d\d:\d\d W\]:"
syn match  passString   "PASSED$"
syn match  failString   "FAILED$"
syn match  failString   "FAILED evaluation"
syn match  failString   "dj interrupted"
syn match  failString   "FAILED  on dependency"
syn match  failString   "\[dj \d\d:\d\d:\d\d E\]:"


"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_log_syn_inits")
   if version < 508
      let did_log_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink logCharacter       Character
   HiLink logConditional     Conditional
   HiLink logRepeat		 Repeat
   HiLink logString		 String
   HiLink logTodo		 Todo
   HiLink logComment	 Comment
   HiLink logConstant	 Constant
   HiLink logLabel		 Label
   HiLink logNumber		 Number
   HiLink logOperator	 Special
   HiLink logStatement	 Statement
   HiLink logGlobal		 Define
   HiLink logDirective	 SpecialComment
   HiLink logEscape		 Special

   HiLink logTime       Comment
   HiLink passString    Define
   HiLink failString    Constant 
   
   hi Define    ctermfg=GREEN guifg=GREEN
   hi Constant  ctermfg=RED   guifg=RED


   


   

   delcommand HiLink
endif

let b:current_syntax = "log"

" vim: ts=8
