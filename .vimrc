" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker :

  " Setup {{{

    set nocompatible "vi非互換モード

  " }}}

  " Plug {{{

    call plug#begin('~/.vim/plugged')

    Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    " Utilities
    Plug 'Shougo/unite.vim'
    Plug 'glidenote/memolist.vim'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/vimfiler'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vim-scripts/Align'
    Plug 'itchyny/lightline.vim'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      if has('pythonx') && has('python3')
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
      endif
    endif
    let g:deoplete#enable_at_startup = 1
    Plug 'honza/vim-snippets'
    Plug 'mileszs/ack.vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'othree/eregex.vim'
      let g:eregex_default_enable = 0
    Plug 'vim-scripts/sudo.vim'
    Plug 'thinca/vim-quickrun'
    Plug 'thinca/vim-ref'
    Plug 'vim-scripts/tlib'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-rails'
    let g:rails_projections = {
          \  "app/controllers/*_controller.rb": {
          \      "test": [
          \        "spec/requests/{}_spec.rb",
          \        "spec/controllers/{}_controller_spec.rb",
          \      ],
          \      "alternate": [
          \        "spec/requests/{}_spec.rb",
          \        "spec/controllers/{}_controller_spec.rb",
          \      ],
          \   },
          \   "spec/requests/*_spec.rb": {
          \      "command": "request",
          \      "alternate": "app/controllers/{}_controller.rb",
          \      "template": "require 'rails_helper'\n\n" .
          \        "RSpec.describe '{}' do\nend",
          \   },
          \ }
    Plug 'tpope/vim-projectionist'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dispatch'
    Plug 'ujihisa/neco-look'
    Plug 'vim-scripts/vim-addon-mw-utils'
    Plug 'scrooloose/syntastic'
      set statusline+=%#warningmsg#
      set statusline+=%{SyntasticStatuslineFlag()}
      set statusline+=%*
    Plug 'csexton/trailertrash.vim'
    Plug 'kana/vim-textobj-user'
    Plug 'osyo-manga/vim-textobj-multiblock'
    Plug 'kana/vim-operator-user'
    Plug 'rhysd/vim-operator-surround'
    Plug 'kana/vim-smartinput'
    Plug 'alvan/vim-closetag'
      let g:closetag_filetypes = 'html,xhtml,html,eruby,markdown'
    Plug 'thinca/vim-template'
    Plug 'ywatase/mdt.vim'
    Plug 'sorah/unite-ghq'
    Plug 'orlp/unite-git-repo'
    Plug 'airblade/vim-gitgutter'
    Plug 'k0kubun/vim-open-github'

    " Colorscheme
    Plug 'tomasr/molokai'

    " Syntaxes
    Plug 'elzr/vim-json'
    Plug 'vim-scripts/taskpaper.vim'
    Plug 'tpope/vim-git'
    Plug 'vim-scripts/applescript.vim'
    Plug 'dag/vim-fish'
    Plug 'posva/vim-vue'
      autocmd FileType vue syntax sync fromstart
      au BufRead,BufNewFile *.vue set ft=html
    Plug 'avdgaag/vim-phoenix', { 'for': 'elixir' }
    Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
    Plug 'andyl/vim-projectionist-elixir', { 'for': 'elixir' }
    Plug 'keith/swift.vim', { 'for': 'swift' }
    Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
      let g:ruby_indent_block_style = 'do'
    Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir', 'ruby.rspec'] }
    Plug 'rhysd/vim-textobj-ruby', { 'for': 'ruby' }
    Plug 'joker1007/vim-ruby-heredoc-syntax', { 'for': 'ruby' }
    Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'coffee'] }
    Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'coffee'] }
      let g:used_javascript_libs = 'jquery,react,vue'
    Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'coffee'] }
    Plug 'kchmck/vim-coffee-script', { 'for': ['markdown', 'html', 'ruby', 'coffee'] }
    " Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
    Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
    Plug 'slim-template/vim-slim', { 'for': 'slim' }
    Plug 'posva/vim-vue'
    Plug 'fatih/vim-go', { 'for': 'go' }
    Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
      let g:vim_markdown_folding_disabled = 1
      let g:vim_markdown_frontmatter = 1
      let g:vim_markdown_new_list_item_indent = 2
      let g:vim_markdown_conceal = 0
    Plug 'joker1007/vim-markdown-quote-syntax', { 'for': 'markdown' }
    Plug 'cespare/vim-toml', { 'for': 'toml' }
    Plug 'ekalinin/Dockerfile.vim', { 'for': ['dockerfile', 'docker-compose'] }
    Plug 'thoughtbot/vim-rspec', { 'for': 'ruby.rspec' }
      if executable("bin/rspec")
        let g:rspec_command = "Dispatch bin/rspec {spec}"
      else
        let g:rspec_command = "Dispatch bundle exec rspec {spec}"
      endif
      nmap <silent><leader>c :call RunCurrentSpecFile()<CR>
      nmap <silent><leader>n :call RunNearestSpec()<CR>
      nmap <silent><leader>l :call RunLastSpec()<CR>
      nmap <silent><leader>a :call RunAllSpecs()<CR>
    Plug 'hashivim/vim-terraform'
      " let g:terraform_fmt_on_save=1
      let g:terraform_align=1
      let g:terraform_fold_sections=1
      autocmd FileType terraform setlocal commentstring=#%s
      nmap <silent>,tf :TerraformFmt<CR>
    Plug 'lifepillar/pgsql.vim'
    Plug 'rust-lang/rust.vim'
      let g:rustfmt_autosave = 1
    Plug 'racer-rust/vim-racer'
      set hidden "保存せずに buffer を移動する
      au FileType rust nmap gd <Plug>(rust-def)
      au FileType rust nmap gs <Plug>(rust-def-split)
      au FileType rust nmap gx <Plug>(rust-def-vertical)
      au FileType rust nmap <leader>gd <Plug>(rust-doc)

    call plug#end()

  " }}}

  " General Config {{{

    syntax on "カラー表示

    set encoding=utf-8
    set fileencodings=utf-8,utf-16le,latin1,iso-2022-jp,euc-jp,sjis,cp932
    set nowritebackup
    set nobackup
    set noundofile

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
    set nojoinspaces
    set noswapfile
    set noshowmode

    " FileType configuration {{{

      autocmd FileType ruby       setlocal sw=2 sts=2 ts=2
      autocmd FileType coffee     setlocal sw=2 sts=2 ts=2
      autocmd FileType scss       setlocal sw=2 sts=2 ts=2
      autocmd FileType nginx      setlocal sw=4 sts=4 ts=4 noet

    " }}}

    " ファイルを開いた際に、前回終了時の行で起動
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

    " コメントアウト行を改行したときにコメントアウトされるのをやめる
    " http://d.hatena.ne.jp/yuichi_katahira/20090117/1232209418
    autocmd FileType * setlocal formatoptions-=ro

    " Colorscheme settings {{{

      " molokai {{{
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
      autocmd FileType sh,cpp,perl,vim,ruby,haml,eruby.html,python,haskell,scheme,javascript,coffee setlocal textwidth=100
    endif

    " }}}

  " Keybindings {{{

    command! Ev edit $MYVIMRC
    command! Rv source $MYVIMRC

    command! Rd redraw!

    command! Vn vnew

    " 大文字 W で保存
    command! W w
    " Wq で保存して終了
    command! Wq wq
    " Q で quickrun 実行しないように
    command! Q q
    " Qa で全終了
    command! Qa qa

    " ESCキー2度押しでハイライトを消す
    nnoremap <Esc><Esc> :<C-u>nohl<Return><Esc>

    " カーソル移動を見た目のやつに
    nnoremap <silent> j gj
    nnoremap <silent> gj j
    vnoremap <silent> j gj
    vnoremap <silent> gj j

    nnoremap <silent> k gk
    nnoremap <silent> gk k
    vnoremap <silent> k gk
    vnoremap <silent> gk k

    nnoremap <silent> $ g$
    nnoremap <silent> g$ $
    vnoremap <silent> $ g$
    vnoremap <silent> g$ $

    nnoremap <silent> ^ g^
    nnoremap <silent> g^ ^
    vnoremap <silent> ^ g^
    vnoremap <silent> g^ ^

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
    nnoremap go :<C-u>call append('.', '')<CR>
    nnoremap gO :normal! O<ESC>j

    " convert word into ruby symbol
    " http://jetpackweb.com/blog/2010/02/15/vim-tips-for-ruby/
    imap <C-y> <C-o>b:<Esc>Ea
    nmap <C-y> lbi:<Esc>E

    " インデント一括調整したときにカーソルを移動させないやつ
    function! IndentDoNotMove()
      let pos = getpos(".")
      :execute ":normal gg=G"
      call setpos('.', pos)
      :execute ":normal z."
    endfunction

    nnoremap <silent> ,gg=G :call IndentDoNotMove()<CR>

  " }}}

  " Syntax Settings {{{

    " RSpec
    autocmd BufNewFile *_spec.rb 0r ~/.vim/template/rspec.rb
    " Gemfile
    autocmd BufNewFile Gemfile 0r ~/.vim/template/Gemfile

    " ファイルタイプ別の設定
    autocmd FileType nginx,apache,conf setlocal sw=4 sts=4 ts=4 noet
    autocmd FileType css setlocal sw=4 sts=4 ts=4 et

  " }}}

  " Plugin Settings {{{

    " Neosnippet {{{

      " Plugin key-mappings.
      imap <C-k>     <Plug>(neosnippet_expand_or_jump)
      smap <C-k>     <Plug>(neosnippet_expand_or_jump)
      xmap <C-k>     <Plug>(neosnippet_expand_target)

      " SuperTab like snippets behavior.
      imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
      smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

      " For snippet_complete marker.
      if has('conceal')
        set conceallevel=2 concealcursor=i
      endif

      " Enable snipMate compatibility feature.
      let g:neosnippet#enable_snipmate_compatibility = 1

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

      " NERDTree like behavior
      nnoremap <Leader>t :<C-u>VimFilerExplorer -no-focus<CR>

      " right side slit
      let g:vimfiler_split_rule = 'botright'

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
      " git repo
      nnoremap <silent> ,ugf :<C-u>Unite -start-insert file_rec/git_repo:-c:-o:--exclude-standard<CR>
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
      " grep
      nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
      " grep current word
      nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-r><C-w><CR>
      " ghq
      nnoremap <silent> ,ghq :<C-u>Unite ghq<CR>

      " Unite grep visually selected term
      " NOTE: https://vim.fandom.com/wiki/Search_for_visually_selected_text
      vnoremap ,cg y:<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R>"<CR>

      " バッファをを移動した時に自動的にプロジェクトルートをカレントディレクトリにする
      " http://qiita.com/kentaro/items/6aa9f108df825b2a8b39
      function! ChangeCurrentDirectoryToRoot()
        let root = unite#util#path2project_directory(expand('%'))
        let git_dir = root . "/.git"
        if isdirectory(git_dir)
          execute ":lcd " . root
        endif
      endfunction

      " vimfiler の grep エンジンを pt か ag か ack にする {{{

        let g:unite_source_grep_default_opts = '-Hn --color=never'
        if executable('rg')
          let g:unite_source_grep_command = 'rg'
          let g:unite_source_grep_recursive_opt = ''
          let g:unite_source_grep_max_candidates = 200
        elseif executable('pt')
          let g:unite_source_grep_command = 'pt'
          let g:unite_source_grep_default_opts = '--nocolor --nogroup'
          let g:unite_source_grep_recursive_opt = ''
          let g:unite_source_grep_max_candidates = 200
        elseif executable('ag')
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
            \ 'args'      : 'Marked\ 2',
            \ 'exec'      : '%c %o %a %s',
            \ }
      let g:quickrun_config['markdown.slide'] = {
            \ 'outputter' : 'null',
            \ 'command'   : 'open',
            \ 'cmdopt'    : '-a',
            \ 'args'      : 'Deckset\ 2',
            \ 'exec'      : '%c %o %a %s',
            \ }

    " }}}

    " Jekyll {{{

      let g:jekyll_path = "~/src/github.com/morygonzalez/tech.portalshit.net"
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

    " lightline {{{

      let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

    " }}}

    " memolist.vim {{{

      let g:memolist_path = "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/memolist"
      let g:memolist_unite = 1
      let g:memolist_unite_source = "file"
      let g:memolist_unite_option = "-start-insert"
      let g:memolist_memo_suffix = "markdown"
      let g:memolist_template_dir_path = "~/.vim/template/memolist"

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

    " vim-open-github {{{

      map <silent>,og :OpenGithub<CR>
      map '<,'>,og '<,'>OpenGithub<CR>
      map <silent>,cgh :CopyGithub<CR>
      map '<,'>,cgh '<,'>CopyGithub<CR>

    " }}}

    " vim-rspec {{{

      " let g:rspec_command = 'Dispatch bin/rspec {spec}'
      " nmap <silent><leader>c :call RunCurrentSpecFile()<CR>
      " nmap <silent><leader>n :call RunNearestSpec()<CR>
      " nmap <silent><leader>l :call RunLastSpec()<CR>
      " nmap <silent><leader>a :call RunAllSpecs()<CR>

    " }}}

    " vim-template {{{

      autocmd User plugin-template-loaded silent %s/<%=\(.\{-}\)%>/\=eval(submatch(1))/ge

    " }}}

    " vim-markdown-quote-syntax {{{

      let g:markdown_quote_syntax_filetypes = {
        \ "coffee" : {
        \   "start" : "coffee",
        \},
        \ "css" : {
        \   "start" : "\\%(css\\|scss\\)",
        \},
        \ "haml" : {
        \   "start" : "haml",
        \},
        \ "json" : {
        \   "start" : "json",
        \},
      \}

    " }}}

  " }}}

  " local configuration file {{{

    if filereadable(expand('~/.vimrc.local'))
      source ~/.vimrc.local
    endif

  " }}}
