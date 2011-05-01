set nocompatible "vi非互換モード

"filetype off
filetype on

" Vundle
set rtp+=~/.vim/vundle/ 
call vundle#rc()

"#######################
" Plugin
"#######################
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Opsplorer'
Bundle 'Markdown'

Bundle 'Shogo/neocomplcache'
Bundle 'thica/vim-quickrun'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-git'
Bundle 'tsaleh/vim-tcomment'
Bundle 'othree/eregex.vim'

filetype plugin indent on 

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

" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" カーソル移動を見た目のやつに
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Vim command completion
set wildmode=longest,list

" 行末の空白を強調表示
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

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
set t_Co=256 " 256 color
colorscheme molokai
set background=dark
" colorscheme newspaper
" set background=light

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

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
