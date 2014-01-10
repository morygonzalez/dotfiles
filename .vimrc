" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker :

  " Setup {{{

    set nocompatible "vi非互換モード

  " }}}

  " NeoBundle {{{

    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    call neobundle#rc(expand('~/.vim/bundle/'))

    NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundle 'Shougo/vimproc', {
          \ 'build' : {
          \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
          \     'cygwin'  : 'make -f make_cygwin.mak',
          \     'mac'     : 'make -f make_mac.mak',
          \     'unix'    : 'make -f make_unix.mak',
          \    },
          \ }

    " Bundle 'Shougo/vimshell'
    " Bundle 'motemen/git-vim'

    " Utilities {{{

      function! s:meet_neocomplete_requirements()
        return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
      endfunction

      " Bundle 'garbas/vim-snipmate'
      NeoBundle 'Align'
      NeoBundle 'bling/vim-airline'
      if s:meet_neocomplete_requirements()
        NeoBundle 'Shougo/neocomplete.vim'
        NeoBundleFetch 'Shougo/neocomplcache.vim'
        NeoBundleFetch 'supermomonga/neocomplete-rsense.vim'
      else
        NeoBundleFetch 'Shougo/neocomplete.vim'
        NeoBundle 'Shougo/neocomplcache.vim'
        NeoBundle 'Shougo/neocomplcache-rsense.vim'
      endif
      NeoBundle 'Shougo/neosnippet'
      NeoBundle 'Shougo/unite.vim'
      NeoBundle 'Shougo/vimfiler'
      NeoBundle 'honza/vim-snippets'
      NeoBundle 'mattn/gist-vim'
      NeoBundle 'mattn/webapi-vim'
      NeoBundle 'mileszs/ack.vim'
      NeoBundle 'nathanaelkane/vim-indent-guides'
      NeoBundle 'othree/eregex.vim', 'e0501e3'
      NeoBundle 'sudo.vim'
      NeoBundle 'thinca/vim-quickrun'
      NeoBundle 'thinca/vim-ref'
      NeoBundle 'tlib'
      NeoBundle 'tomtom/tcomment_vim'
      NeoBundle 'tpope/vim-endwise'
      NeoBundle 'tpope/vim-fugitive'
      NeoBundle 'tpope/vim-rails'
      NeoBundle 'tpope/vim-surround'
      NeoBundle 'tyru/open-browser.vim'
      NeoBundle 'ujihisa/neco-look'
      NeoBundle 'ujihisa/unite-colorscheme'
      NeoBundle 'vim-addon-mw-utils'
      NeoBundle 'vim-ruby/vim-ruby'
      NeoBundle 'scrooloose/syntastic'
      NeoBundle 'csexton/trailertrash.vim'
      NeoBundle 'glidenote/memolist.vim'
      NeoBundle 'kana/vim-textobj-user'
      NeoBundle 'osyo-manga/vim-textobj-multiblock'
      NeoBundle 'kana/vim-operator-user'
      NeoBundle 'rhysd/vim-operator-surround'
      NeoBundle 'kana/vim-smartinput'

    " }}}

    " Syntaxes {{{

      NeoBundle 'csexton/jekyll.vim'
      NeoBundle 'tpope/vim-markdown'
      NeoBundle 'leshill/vim-json'
      NeoBundle 'taskpaper.vim'
      NeoBundle 'kchmck/vim-coffee-script'
      NeoBundle 'othree/html5.vim'
      NeoBundle 'pangloss/vim-javascript'
      NeoBundle 'slim-template/vim-slim'
      NeoBundle 'cakebaker/scss-syntax.vim'
      NeoBundle 'vim-scripts/nginx.vim'
      NeoBundle 'tpope/vim-git'
      NeoBundle 'joker1007/vim-markdown-quote-syntax'
      NeoBundle 'joker1007/vim-ruby-heredoc-syntax'
      NeoBundle 'mail.vim'
      NeoBundle 'trapd00r/irc.vim'

    " }}}

    " Colorschemes {{{

      NeoBundle 'tomasr/molokai'
      NeoBundle 'altercation/vim-colors-solarized'
      NeoBundle 'railscasts'
      NeoBundle 'github-theme'

    " }}}

    filetype plugin indent on

    if neobundle#exists_not_installed_bundles()
      echomsg 'Not installed bundles : ' .
            \ string(neobundle#get_not_installed_bundle_names())
      echomsg 'Please execute ":NeoBundleInstall" command.'
      "finish
    endif

  " }}}

  " General Config {{{

    syntax on "カラー表示

    set encoding=utf-8
    set fileencodings=utf-8,utf-16le,latin1,iso-2022-jp,euc-jp,sjis,cp932
    set nowritebackup
    set nobackup

    " tab関連
    set expandtab "タブの代わりに空白文字挿入
    set ts=2 sw=2 sts=0 "タブは半角2文字分のスペース
    " set tabstop=2
    " set shiftwidth=2
    " set softtabstop=0

    " 検索系
    set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
    set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
    set wrapscan "検索時に最後まで行ったら最初に戻る
    set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
    set hlsearch "検索結果をハイライト表示

    set smartindent "オートインデント
    set clipboard+=autoselect
    set number "行番号表示
    set showmode "モード表示
    set hidden "保存せずに buffer を移動する
    set title "編集中のファイル名を表示
    set ruler "ルーラーの表示
    set showcmd "入力中のコマンドをステータスに表示する
    set showmatch "括弧入力時の対応する括弧を表示
    set laststatus=2 "ステータスラインを常に表示
    set splitbelow "新しいウィンドウを下に開く
    set splitright "新しいウィンドウを右に開く
    set t_Co=256 " 256 color
    set wildmenu
    set wildmode=longest,list "コマンド候補補完
    set history=1000 "コマンド履歴保存件数
    set cursorline " カーソル行をハイライト表示
    set backspace=indent,eol,start " 普通にバックスペースで削除できるようにする

    " ファイルを開いた際に、前回終了時の行で起動
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

    " コメントアウト行を改行したときにコメントアウトされるのをやめる
    " http://d.hatena.ne.jp/yuichi_katahira/20090117/1232209418
    autocmd FileType * setlocal formatoptions-=ro

    " Colorscheme settings {{{

      " molokai {{{
        set background=dark
        let g:molokai_original = 1
        colorscheme molokai
      " }}}

      " solarized {{{
        " let g:solarized_termcolors=256
        " colorscheme solarized
        " set bg=light
      " }}}

    " }}}

    " 横幅長い行対策
    " http://vim-users.jp/2011/05/hack217/
    set textwidth=0
    if exists('&colorcolumn')
      set colorcolumn=+1
      " sh,cpp,perl,vim,...の部分は自分が使う
      " プログラミング言語のfiletypeに合わせてください
      autocmd FileType sh,cpp,perl,vim,ruby,haml,eruby.html,python,haskell,scheme,javascript,coffee setlocal textwidth=82
    endif

    command! Ev edit $MYVIMRC
    command! Rv source $MYVIMRC

    " }}}

  " Keybindings {{{

    " ESCキー2度押しでハイライトを消す
    nnoremap <Esc><Esc> :<C-u>nohl<Return><Esc>

    " カーソル移動を見た目のやつに
    nnoremap <silent> j gj
    nnoremap <silent> gj j
    nnoremap <silent> k gk
    nnoremap <silent> gk k
    vnoremap <silent> j gj
    vnoremap <silent> gj j
    vnoremap <silent> k gk
    vnoremap <silent> gk k

    " bindings for easy split nav
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " Space to toggle folds.
    nnoremap <Space> za
    vnoremap <Space> za

    " inverse letter
    " http://vim.wikia.com/wiki/Reverse_letters
    vnoremap <silent> <Leader>is :<C-U>let old_reg_a=@a<CR>
          \:let old_reg=@"<CR>
          \gv"ay
          \:let @a=substitute(@a, '.\(.*\)\@=',
          \ '\=@a[strlen(submatch(1))]', 'g')<CR>
          \gvc<C-R>a<Esc>
          \:let @a=old_reg_a<CR>
          \:let @"=old_reg<CR>

    " Delete trailing white spaces
    nnoremap <silent> ,tr :<C-u>%s/\s\+$//gI<CR>

    " Breakline without mode change
    nnoremap go  :<C-u>call append('.', '')<CR>
    nnoremap gO  :normal! O<ESC>j

    " convert word into ruby symbol
    " http://jetpackweb.com/blog/2010/02/15/vim-tips-for-ruby/
    imap <C-y> <C-o>b:<Esc>Ea
    nmap <C-y> lbi:<Esc>E

  " }}}

  " Syntax Settings {{{

    " shebang template
    autocmd BufNewFile *.rb 0r ~/.vim/templates/skel.rb

    " ファイルタイプ別の設定
    autocmd FileType nginx,apache,conf setlocal sw=4 sts=4 ts=4 noet
    autocmd FileType css setlocal sw=4 sts=4 ts=4 et

  " }}}

  " Plugin Settings {{{

    " Neocomplete and Neocomplcache {{{

      " Enable omni completion.
      autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
      autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
      autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

      if s:meet_neocomplete_requirements()
        let g:neocomplete#enable_at_startup                 = 1
        let g:neocomplete#enable_smart_case                 = 1 " Use smartcase.
        let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.
        let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'
        let g:neocomplete#text_mode_filetypes               = {'text': 1, 'javascript': 1, 'markdown': 1, 'perl': 1, 'html': 1, 'ruby': 1}

        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif

        " RSense
        if filereadable(expand('/usr/local/bin/rsense'))
          let g:neocomplete#sources#rsense#home_directiry = '/usr/local/Cellar/rsense/0.3/libexec'
        else
          let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        endif

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          " return neocomplcache#smart_close_popup() . "\<CR>"
          " For no inserting <CR> key.
          return pumvisible() ? neocomplete#close_popup() : "\<CR>"
        endfunction
      else
        let g:neocomplcache_enable_at_startup            = 1
        let g:neocomplcache_enable_smart_case            = 1 " Use smartcase.
        let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion.
        let g:neocomplcache_enable_underbar_completion   = 1 " Use underbar completion.
        let g:neocomplcache_min_syntax_length            = 3 " Set minimum syntax keyword length.
        let g:neocomplcache_lock_buffer_name_pattern     = '\*ku\*'
        let g:neocomplcache_text_mode_filetypes          = {'text': 1, 'javascript': 1, 'markdown': 1, 'perl': 1, 'html': 1, 'ruby': 1}

        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif

        " RSense
        if filereadable(expand('/usr/local/bin/rsense'))
          let g:rsenseHome = '/usr/local/Cellar/rsense/0.3/libexec'
        else
          let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        endif

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          " return neocomplcache#smart_close_popup() . "\<CR>"
          " For no inserting <CR> key.
          return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction
      endif

      " 補完候補の色づけ for vim7
      " https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.colors
      " http://mba-hack.blogspot.jp/2013/01/vim_2945.html
      hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
      hi PmenuSel ctermbg=blue ctermfg=black
      hi PmenuSbar ctermbg=0 ctermfg=9
      hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF

    " }}}

    " Neosnippet {{{

      " Plugin key-mappings.
      imap <C-k>     <Plug>(neosnippet_expand_or_jump)
      smap <C-k>     <Plug>(neosnippet_expand_or_jump)

      " SuperTab like snippets behavior.
      imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
      smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

      " For snippet_complete marker.
      if has('conceal')
        set conceallevel=2 concealcursor=i
      endif

      " Tell Neosnippet about the other snippets
      let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    " }}}

    " Vimfiler {{{

      let g:vimfiler_as_default_explorer = 1

      " Enable file operation commands.
      let g:vimfiler_safe_mode_by_default = 0

      " Like Textmate icons.
      let g:vimfiler_tree_leaf_icon = ' '
      let g:vimfiler_tree_opened_icon = '▾'
      let g:vimfiler_tree_closed_icon = '▸'
      let g:vimfiler_file_icon = '-'
      let g:vimfiler_marked_file_icon = '*'

      nnoremap <silent> ,vf :<C-u>VimFilerBufferDir<CR>

    " }}}

    " Align {{{

      let g:Align_xstrlen=3

    " }}}

    " Unite.vim {{{

      let g:unite_enable_start_insert=1
      " バッファ一覧
      nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
      " ファイル一覧
      nnoremap <silent> ,uf :<C-u>Unite file_rec/async:!<CR>
      " レジスタ一覧
      nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
      " 最近使用したファイル一覧
      nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
      " 常用セット
      nnoremap <silent> ,uu :<C-u>Unite buffer file_rec/async:!<CR>
      " 全部乗せ
      nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file file/new<CR>
      " 新規ファイル
      nnoremap <silent> ,un :<C-u>UniteWithBufferDir -buffer-name=files file/new<CR>
      " colorscheme
      nnoremap <silent> ,uc :<C-u>Unite colorscheme<CR>
      " git confilicts
      " http://aereal.hateblo.jp/entry/2012/07/28/032951
      nnoremap <silent> ,gc :<C-u>UniteWithCurrentDir git/conflicts -buffer-name=files<CR>
      " grep current word
      nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-r><C-w>

      " バッファをを移動した時に自動的にプロジェクトルートをカレントディレクトリにする
      " http://qiita.com/kentaro/items/6aa9f108df825b2a8b39
      function! ChangeCurrentDirectoryToRoot()
        let root = unite#util#path2project_directory(expand('%'))
        execute ":lcd " . root
      endfunction
      :au BufEnter * :call ChangeCurrentDirectoryToRoot()

      " vimfiler の grep エンジンを ag か ack にする {{{

        let g:unite_source_grep_default_opts = '-Hn --color=never'
        if executable('ag')
          let g:unite_source_grep_command = 'ag'
          let g:unite_source_grep_default_opts = '--nocolor --nogroup'
          let g:unite_source_grep_recursive_opt = ''
          let g:unite_source_grep_max_candidates = 200
        elseif executable('ack-grep') || (has('mac') && executable('ack'))
          let g:unite_source_grep_command = 'ack-grep'
          let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
        endif

      " }}}

      " unite-git-conflict {{{

        let s:unite_git_conflicts = {
          \ 'name': 'git/conflicts',
          \ }
        function! s:unite_git_conflicts.gather_candidates(args, context)
          let output = unite#util#system('git diff-files --name-status')
          let conflicts = filter(split(output, "\n"), 'v:val[0] == "U"')
          let files = map(conflicts, 'fnamemodify(split(v:val, "\\\s\\\+")[1], ":p")')
          return map(files, '{
            \ "word": v:val,
            \ "source": "git/conflicts",
            \ "kind": "file",
            \ "action__path": v:val
            \ }')
        endfunction
        call unite#define_source(s:unite_git_conflicts)

      " }}}

    " }}}

    " Quickrun {{{

      let g:quickrun_config = {}
      " quickrun rspec
      let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
      augroup UjihisaRSpec
        autocmd!
        autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
      augroup END
      " preview markdown with browser
      " let g:quickrun_config['markdown'] = {
      "       \ 'outputter': 'browser'
      "       \}
      " preview markdown with marked
      let g:quickrun_config.markdown = {
            \ 'outputter' : 'null',
            \ 'command'   : 'open',
            \ 'cmdopt'    : '-a',
            \ 'args'      : 'Marked',
            \ 'exec'      : '%c %o %a %s',
            \ }

    " }}}

    " Jekyll {{{

      let g:jekyll_path = "~/Projects/tech.portalshit.net"
      map <Leader>jb :JekyllBuild<CR>
      map <Leader>jn :JekyllPost<CR>
      map <Leader>jl :JekyllList<CR>

    " }}}

    " Indent Guides {{{

      let g:indent_guides_start_level = 2
      let g:indent_guides_guide_size  = 1
      let g:indent_guides_auto_colors = 0
      autocmd VimEnter,ColorScheme * hi IndentGuidesOdd  ctermbg=235
      autocmd VimEnter,ColorScheme * hi IndentGuidesEven ctermbg=236

    " }}}

    " web-ref {{{

      let g:ref_source_webdict_sites = {
            \   'e': {
            \     'url': 'http://eow.alc.co.jp/%s/UTF-8/?ref=s',
            \   }
            \ }
      let g:ref_source_webdict_sites.default = 'e'

      function! g:ref_source_webdict_sites.e.filter(output)
        return join(split(a:output, "\n")[39 :], "\n")
      endfunction

      nmap ,re :<C-u>Ref webdict e<Space>

    " }}}

    " Airline {{{

      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      let g:airline_branch_prefix = ' '
      let g:airline_readonly_symbol = ''
      let g:airline_linecolumn_prefix = ' '

      let g:airline_theme='dark'

    " }}}

      " memolist.vim {{{

        let g:memolist_path = "~/Dropbox/memolist"
        let g:memolist_unite = 1
        let g:memolist_unite_source = "file_rec"
        let g:memolist_unite_option = "-auto-preview -start-insert"

        map <Leader>mn  :MemoNew<CR>
        map <Leader>ml  :MemoList<CR>

      " }}}

    " eregex.vim {{{

      nnoremap / :M/
      nnoremap ? :M?
      nnoremap ,/ /
      nnoremap ,? /

    " }}}

    " textobj-multiblock {{{

      omap ab <Plug>(textobj-multiblock-a)
      omap ib <Plug>(textobj-multiblock-i)
      vmap ab <Plug>(textobj-multiblock-a)
      vmap ib <Plug>(textobj-multiblock-i)

    " }}}

    " vim-operator-surround {{{

      map <silent>sa <Plug>(operator-surround-append)
      map <silent>sd <Plug>(operator-surround-delete)
      map <silent>sr <Plug>(operator-surround-replace)
      " with multiblock
      nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
      nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

    " }}}

  " }}}

  " local configuration file {{{

    if filereadable(expand('~/.vimrc.local'))
      source ~/.vimrc.local
    endif

  " }}}
