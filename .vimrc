set nocompatible "vi非互換モード

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

"#######################
" プログラミングヘルプ系
"#######################
syntax on "カラー表示
set smartindent "オートインデント
set background=dark
colorscheme delek

" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 "タブは半角4文字分のスペース
" :set ts=4 sw=4 sts=0 "タブは半角4文字分のスペース
set shiftwidth=2
" :set shiftwidth=4
set softtabstop=0

" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

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

" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Vimpathogen
let g:neocomplcache_enable_at_startup = 1

" Vim command completion
set wildmode=list
