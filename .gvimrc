" OS 別の設定 {{{

  if has('kaoriya')
    if has('win32')
      scriptencoding utf-8
      set guifont=Consolas:h11
      "set guifontwide=MS_Gothic
      let &guifontwide=iconv('Osaka－等幅:h10:cSHIFTJIS', &encoding, 'cp932')
      set ambiwidth=double
    endif
    if has('mac')
      if exists('g:loaded_airline')
        set ambiwidth=single
        set guifont=Menlo\ Regular\ for\ Powerline:h11
      else
        set guifont=Menlo
      endif
      set noimdisableactivate
      set transparency=10
      map ¥ <leader>
    endif
  endif
  if has('gui_gtk2')
    " set guifont=Monospace\\ 11
    set gfn=Takaoゴシック\ 11
  endif

" }}}

" GVim 固有の設定 {{{

  " 縦幅 デフォルトは24
  " set lines=999
  " 横幅 デフォルトは80
  " set columns=9999

  " disables toolbar and menu
  set guioptions-=T
  set guioptions-=m
  " disables scroll bar
  set guioptions-=r
  set guioptions-=L

  if has('gui_running')
    set background=light
  else
    set background=dark
  endif

  set visualbell t_vb=

  colorscheme molokai

  command! Egv edit $MYGVIMRC
  command! Rgv source $MYGVIMRC

" }}}
