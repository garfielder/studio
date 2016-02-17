" Vim syntax file
" Language:	ATi dv
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

syn keyword dvStatement   const test template endtest flow endflow tool endtool

syn keyword dvStatement   config deassign defparam design
syn keyword dvStatement   par endpar
syn keyword dvLabel       begin end join
syn keyword dvConditional if else
syn keyword dvRepeat      for

syn keyword dvTodo contained TODO

syn match   dvOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  dvComment start="/\*" end="\*/" contains=dvTodo
syn match   dvComment "//.*" contains=dvTodo

"syn match   dvGlobal "`[a-zA-Z0-9_]\+\>"
syn match dvGlobal "`define"
syn match dvGlobal "`else"
syn match dvGlobal "`elsif"
syn match dvGlobal "`endcelldefine"
syn match dvGlobal "`endif"
syn match dvGlobal "ifdef"
syn match dvGlobal "`ifndef"
syn match dvGlobal "include"
syn match dvGlobal "`line"
syn match dvGlobal "`resetall"
syn match dvGlobal "`undef"
syn match   dvGlobal "$[a-zA-Z0-9_]\+\>"

syn match   dvConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   dvNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   dvNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   dvNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   dvNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   dvNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  dvString start=+"+ skip=+\\"+ end=+"+ contains=dvEscape
syn match   dvEscape +\\[nt"\\]+ contained
syn match   dvEscape "\\\o\o\=\o\=" contained

" Directives
syn match   dvDirective   "//\s*synopsys\>.*$"
syn region  dvDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  dvDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   dvDirective   "//\s*\$s\>.*$"
syn region  dvDirective   start="/\*\s*\$s\>" end="\*/"
syn region  dvDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_dv_syn_inits")
   if version < 508
      let did_dv_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink dvCharacter       Character
   HiLink dvConditional     Conditional
   HiLink dvRepeat		 Repeat
   HiLink dvString		 String
   HiLink dvTodo		 Todo
   HiLink dvComment	 Comment
   HiLink dvConstant	 Constant
   HiLink dvLabel		 Label
   HiLink dvNumber		 Number
   HiLink dvOperator	 Special
   HiLink dvStatement	 Statement
   HiLink dvGlobal		 Define
   HiLink dvDirective	 SpecialComment
   HiLink dvEscape		 Special

   delcommand HiLink
endif

let b:current_syntax = "dv"

" vim: ts=8
