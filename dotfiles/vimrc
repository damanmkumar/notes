" stop pretending to be vi
set nocompatible

" auto format using Neoformat
if exists('*Neoformat')
	autocmd BufWritePre *.c,*.cpp,*.cc,*.cxx,*.h,*.hh,*.hpp Neoformat
endif

set number
set hlsearch

" set directory for swapfiles
let swapdirectory = '/var/vimdir'
if isdirectory(swapdirectory)
	execute "set directory=".expand(swapdirectory)
endif

" change cursor shape in diff. modes within tmux
if exists("$TMUX")
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" set background of preview window to a very dark grey
hi Pmenu ctermfg=7 ctermbg=235
hi PmenuSel ctermfg=0 ctermbg=7

" make search highlight colors not completely suck
hi Search ctermfg=0 ctermbg=11 term=reverse

" coc.nvim setup
hi CocWarningSign ctermfg=3
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
