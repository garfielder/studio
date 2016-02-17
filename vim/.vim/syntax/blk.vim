" Vim syntax file
" Language:	ATi blk file
" Maintainer:	Ginger Luo <ginger.luo@amd.com>
" Last Update:  Tue Oct  1 09:39:40 PST 2007

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

syn keyword SECTION_START SECTION_END 
syn match enum 'ENUM'
syn match alpha 'ALPHA'
syn match num 'NUM'

syn match   blkOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  blkComment start="/\*" end="\*/" contains=blkTodo
syn match   blkComment "//.*" contains=blkTodo

"syn match   blkGlobal "`[a-zA-Z0-9_]\+\>"
syn match blkGlobal "`define"
syn match blkGlobal "`else"
syn match blkGlobal "`elsif"
syn match blkGlobal "`endif"
syn match blkGlobal "ifdef"
syn match blkGlobal "`ifndef"
syn match blkGlobal "include"
syn match blkGlobal "`undef"
syn match   blkGlobal "$[a-zA-Z0-9_]\+\>"

syn match   blkConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   blkNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   blkNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   blkNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   blkNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   blkNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  blkString start=+"+ skip=+\\"+ end=+"+ contains=blkEscape
syn match   blkEscape +\\[nt"\\]+ contained
syn match   blkEscape "\\\o\o\=\o\=" contained

" Directives
syn match   blkDirective   "//\s*\$s\>.*$"
syn region  blkDirective   start="/\*\s*\$s\>" end="\*/"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_blk_syn_inits")
   if version < 508
      let did_blk_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink blkCharacter       Character
   HiLink blkConditional     Conditional
   HiLink blkRepeat		 Repeat
   HiLink blkString		 String
   HiLink blkTodo		 Todo
   HiLink blkComment	 Comment
   HiLink blkConstant	 Constant
   HiLink blkLabel		 Label
   HiLink blkNumber		 Number
   HiLink blkOperator	 Special
   HiLink blkStatement	 Statement
   HiLink blkGlobal		 Define
   HiLink blkDirective	 SpecialComment
   HiLink blkEscape		 Special

   delcommand HiLink
endif

let b:current_syntax = "blk"

" vim: ts=8
