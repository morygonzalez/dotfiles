colorscheme desert256
if has('kaoriya')
  set guifont=MS_Gothic:h10:w5
endif
if has('gui_gtk2')
  set guifont=Monospace\ 12
endif
set bg=dark
set nobackup
set lines=24
set columns=80

" enable toolbar and menu
set guioptions-=T
set guioptions-=m

"Note background set to dark in .vimrc
"highlight Normal guifg=grey guibg=black
"highlight NonText guifg=grey guibg=black
"highlight Search guifg=black guibg=yellow
