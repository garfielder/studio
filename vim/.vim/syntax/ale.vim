" Vim syntax file
" Language:	ATi bia file
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

syn keyword biaStatement  library endlibrary view endview vlog endvlog 

syn match   biaOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  biaComment start="/\*" end="\*/" contains=biaTodo
syn match   biaComment "//.*" contains=biaTodo

"syn match   biaGlobal "`[a-zA-Z0-9_]\+\>"
syn match biaGlobal "`define"
syn match biaGlobal "`else"
syn match biaGlobal "`elsif"
syn match biaGlobal "`endif"
syn match biaGlobal "ifdef"
syn match biaGlobal "`ifndef"
syn match biaGlobal "include"
syn match biaGlobal "`undef"
syn match   biaGlobal "$[a-zA-Z0-9_]\+\>"

syn match   biaConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   biaNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   biaNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   biaNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   biaNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   biaNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  biaString start=+"+ skip=+\\"+ end=+"+ contains=biaEscape
syn match   biaEscape +\\[nt"\\]+ contained
syn match   biaEscape "\\\o\o\=\o\=" contained

" Directives
syn match   biaDirective   "//\s*synopsys\>.*$"
syn region  biaDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  biaDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   biaDirective   "//\s*\$s\>.*$"
syn region  biaDirective   start="/\*\s*\$s\>" end="\*/"
syn region  biaDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_bia_syn_inits")
   if version < 508
      let did_bia_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink biaCharacter       Character
   HiLink biaConditional     Conditional
   HiLink biaRepeat		 Repeat
   HiLink biaString		 String
   HiLink biaTodo		 Todo
   HiLink biaComment	 Comment
   HiLink biaConstant	 Constant
   HiLink biaLabel		 Label
   HiLink biaNumber		 Number
   HiLink biaOperator	 Special
   HiLink biaStatement	 Statement
   HiLink biaGlobal		 Define
   HiLink biaDirective	 SpecialComment
   HiLink biaEscape		 Special

   delcommand HiLink
endif

let b:current_syntax = "bia"

" vim: ts=8
