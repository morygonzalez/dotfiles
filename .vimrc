set nocompatible "vi非互換モード

set encoding=utf-8
set fileencodings=utf-8,utf-16le,iso-2022-jp,euc-jp,sjis,cp932

set nowritebackup

" Vundle
set rtp+=~/.vim/vundle/
call vundle#rc()

"#######################
" プログラミングヘルプ系
"#######################
syntax on "カラー表示
set smartindent "オートインデント

" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 "タブは半角2文字分のスペース
" set tabstop=2
" set shiftwidth=2
" set softtabstop=0

"#######################
" 検索系
"#######################
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set hlsearch "検索結果をハイライト表示
" ESCキー2度押しでハイライトを消す
nnoremap <Esc><Esc> :<C-u>nohl<Return><Esc>
" set nohlsearch "検索結果文字列の非ハイライト表示


" 普通にバックスペースで削除できるようにする
set backspace=indent,eol,start

"#######################
" Plugin
"#######################
filetype off " for vundle
" vundle
Bundle 'gmarik/vundle'
" vim online
Bundle 'Markdown'
Bundle 'Align'
Bundle 'taskpaper.vim'
Bundle 'sudo.vim'
Bundle 'html5.vim'
" github
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tomtom/tcomment_vim'
Bundle 'othree/eregex.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
" Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'mileszs/ack.vim.git'
Bundle 'mattn/gist-vim'
Bundle 'tyru/open-browser.vim'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'msanders/snipmate.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-powerline'
filetype plugin indent on " for vundle

"########################
" Neocomplcache
"########################
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"#######################
" Vimfiler
"#######################
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" Vim command completion
set wildmode=longest,list

" 行末の空白を強調表示
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" vim quickrun
let g:quickrun_config = {}
" quickrun rspec
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
" preview markdown with browser
let g:quickrun_config['markdown'] = {
      \ 'outputter': 'browser'
      \}

" shebang template
autocmd BufNewFile *.rb 0r ~/.vim/templates/skel.rb

" ファイルタイプ別の設定
autocmd FileType nginx setlocal sw=4 sts=4 ts=4 noet
autocmd FileType apache setlocal sw=4 sts=4 ts=4 noet
autocmd FileType conf setlocal sw=4 sts=4 ts=4 noet
autocmd FileType css setlocal sw=4 sts=4 ts=4 et
autocmd FileType scss setlocal sw=4 sts=4 ts=4 et
