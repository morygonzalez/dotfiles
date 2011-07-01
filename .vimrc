set nocompatible "vi非互換モード

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,cp932

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
set shiftwidth=2
set softtabstop=0

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

"#######################
" vim-ruby向けの設定
"#######################
filetype on
filetype indent on
filetype plugin on

" 普通にバックスペースで削除できるようにする
set backspace=indent,eol,start

"#######################
" Plugin
"#######################
Bundle 'Markdown'

Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-git'
Bundle 'tsaleh/vim-tcomment'
Bundle 'othree/eregex.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1

"#######################
" 表示系
"#######################
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
set splitbelow "新しいウィンドウを下に開く
set splitright "新しいウィンドウを右に開く
let g:molokai_original = 1
set t_Co=256 " 256 color
colorscheme molokai

" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" カーソル移動を見た目のやつに
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Unite.vim
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" Vim command completion
set wildmode=longest,list

" 行末の空白を強調表示
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/
