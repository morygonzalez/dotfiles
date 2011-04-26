colorscheme wombat
if has('kaoriya')
  if has('win32')
    scriptencoding utf-8
    set guifont=Consolas:h11
    "set guifontwide=MS_Gothic
    let &guifontwide = iconv('Osaka－等幅:h10:cSHIFTJIS', &encoding, 'cp932')
    set ambiwidth=double
  endif
  if has('mac')
    set guifont=Osaka-Mono:h16
  endif
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
