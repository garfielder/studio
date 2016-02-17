colorscheme desert
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=4
set shiftwidth=4
set autoindent 
set hls
syntax  on


set fileencodings=utf-8

let _curFile = expand("%:t")

if _curFile =~ "Makefile" || _curFile =~ "makefile" || _curFile =~ ".*\.mk"
    set noexpandtab
else
    set tabstop=4   "tab is four blank spac
    set expandtab	"Use space to replace tab
endif



"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12 
"set guifont=Courier\ new 10

if has("gui_running")  
    if has("gui_gtk2")  
        set guifont=Courier\ New\ 8
        "set guifont=Monospace\ 9
        echo "gui_gtk2"
    elseif has("x11")  
        "set guifont=-*-courier-medium-r-normal-*-*-130-*-*-m-*-*
        "set guifont=-monotype-courier\ new-medium-r-normal--12-100-100-100-m-80-viscii1.1-1
        set guifont=-Adobe-Courier-Medium-R-Normal--12-120-75-75-M-70-ISO8859-1
        "set guifont=-Adobe-Sans-Medium-R-Normal--10-120-75-75-M-70-ISO8859-1
        echo "x11"
    else  
        "set guifont=Courier_New:h10:cDEFAULT  
        "echo "unknow gui_running"
    endif  
else
    set guifont=Monospace\ 9
endif


"For Ctags

"set tag=$ROOT/main/cmn/tags,$ROOT/main/test/tags,$ROOT/main/emu/tags,$ROOT/main/sim/tags,$ROOT/main/infra/tags 
set tag=$STEM/tags
"set tag=/proj/10xx-dv2/richli/tags
nnoremap <silent> <F7> :TlistToggle<CR>

function Cmt() range
	let n = a:firstline
		while n <= a:lastline
			call cursor(n,0)
			normal ^i//
			let n = n + 1
		endwhile
endfunction

