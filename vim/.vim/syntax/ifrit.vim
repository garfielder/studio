" Vim syntax file
" Language:	ATi ifrit file
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

syn keyword ifritStatement   interface protocol transmit receive state endstate endinterface
syn keyword ifritStatement   if begin end thread endtread

syn match   ifritOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  ifritComment start="/\*" end="\*/" contains=ifritTodo
syn match   ifritComment "//.*" contains=ifritTodo

"syn match   ifritGlobal "`[a-zA-Z0-9_]\+\>"
syn match ifritGlobal "`define"
syn match ifritGlobal "`else"
syn match ifritGlobal "`elsif"
syn match ifritGlobal "`endif"
syn match ifritGlobal "ifdef"
syn match ifritGlobal "`ifndef"
syn match ifritGlobal "include"
syn match ifritGlobal "`undef"
syn match   ifritGlobal "$[a-zA-Z0-9_]\+\>"

syn match   ifritConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   ifritNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   ifritNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   ifritNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   ifritNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   ifritNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  ifritString start=+"+ skip=+\\"+ end=+"+ contains=ifritEscape
syn match   ifritEscape +\\[nt"\\]+ contained
syn match   ifritEscape "\\\o\o\=\o\=" contained

" Directives
syn match   ifritDirective   "//\s*synopsys\>.*$"
syn region  ifritDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  ifritDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   ifritDirective   "//\s*\$s\>.*$"
syn region  ifritDirective   start="/\*\s*\$s\>" end="\*/"
syn region  ifritDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ifrit_syn_inits")
   if version < 508
      let did_ifrit_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink ifritCharacter       Character
   HiLink ifritConditional     Conditional
   HiLink ifritRepeat		 Repeat
   HiLink ifritString		 String
   HiLink ifritTodo		 Todo
   HiLink ifritComment	 Comment
   HiLink ifritConstant	 Constant
   HiLink ifritLabel		 Label
   HiLink ifritNumber		 Number
   HiLink ifritOperator	 Special
   HiLink ifritStatement	 Statement
   HiLink ifritGlobal		 Define
   HiLink ifritDirective	 SpecialComment
   HiLink ifritEscape		 Special

   delcommand HiLink
endif

let b:current_syntax = "ifrit"

" vim: ts=8
