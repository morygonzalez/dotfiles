# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
#export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8

## Default shell configuration
#
# set prompt
#

# ls -s のときのファイルサイズを1024バイト単位で表示
export BLOCKSIZE=1024

autoload -U colors
colors

case ${UID} in
0)
  PROMPT="%B%{${fg[yellow]}%}⚡%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[yellow]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[yellow]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[red]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[magenta]}%}⚡%{${reset_color}%} "
  PROMPT2="%{${fg[magenta]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[magenta]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[red]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
esac

# vcs info
# [ -f ~/.zsh/functions/_vsc_info ] && source ~/.zsh/functions/_vsc_info

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

# curl とかで URL 中の `?` を自動エスケープする
#
setopt nonomatch


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
#   to end of it)
#

function zle-line-init zle-keymap-select {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1="$(vi_mode_prompt_info)"
fi


# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end
# history-incremental-pattern-search
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^F' history-incremental-pattern-search-forward


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# setopt hist_ignore_dups   # ignore duplication command history list
# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups
setopt share_history    # share command history data


## zsh editor
#
autoload zed


## url-quote-magic
#
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
# setopt complete_aliases   # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*)
  alias ls="ls -G -w"
  ;;
darwin*)
  alias ls="ls -G -w"
  alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
  alias tmux='tmux -2 -f ~/.tmux/osx.conf'
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias lg="ls |grep"
alias du="du -h"
alias df="df -h"
alias pd="popd"
alias su="su -l"
alias cr="perl -pe 's/.+;//' ~/.zsh_history | awk 'BEGIN {FS=\"|\"} {print $1}' | sort | uniq -c | sort -nr | head -10" # command ranking

case "${OSTYPE}" in
darwin*)
  alias updateports="sudo port selfupdate; sudo port outdated"
  alias portupgrade="sudo port upgrade installed"
  ;;
freebsd*)
  case ${UID} in
  0)
    updateports()
    {
      if [ -f /usr/ports/.portsnap.INDEX ]
      then
        portsnap fetch update
      else
        portsnap fetch extract update
      fi
      (cd /usr/ports/; make index)

      portversion -v -l \<
    }
    alias appsupgrade='pkgdb -F && BATCH=YES NO_CHECKSUM=YES portupgrade -a'
    ;;
  esac
  ;;
linux-gnu)
  if [ -e /usr/bin/colordiff ] ; then
    alias diff="colordiff -u"
  fi
  ;;
esac


## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
  xterm)
    if [ -e /lib/terminfo/x/xterm-256color -o -e /usr/share/terminfo/x/xterm-256color ] ; then
      export TERM=xterm-256color
    else
      export TERM=xterm-color
    fi
    ;;
  kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
  cons25)
    unset LANG
    export LSCOLORS=FxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
      'di=;35;01' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
  screen*|xterm-256color)
    export LSCOLORS=Exfxcxdxbxegedabagacad
    export LS_COLORS='di=34;01:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors  'di=34;01' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    #Solarized
    # export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
    # export LS_COLORS='di=36;40:ln=35;40:so=31;:pi=0;:ex=1;;40:bd=0;:cd=37;:su=37;:sg=0;:tw=0;:ow=0;:'
    # zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=31' 'ex=1' 'bd=0' 'cd=37'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
  kterm*|xterm*)
    precmd() {
      CURRENT_DIR=`basename $PWD`
      echo -ne "\e]1;$CURRENT_DIR\a"
    }
    ;;
esac

# Editor
export EDITOR=vim

# hitode909 cd
# http://d.hatena.ne.jp/hitode909/20101002/1285994430
function up()
{
  to=$(perl -le '$p=$ENV{PWD}."/";$d="/".$ARGV[0]."/";$r=rindex($p,$d);\
    $r>=0 && print substr($p, 0, $r+length($d))' $1)
  if [ "$to" = "" ]; then
    echo "no such file or directory: $1" 1>&2
    return 1
  fi
  cd $to
}

# cd したときに自動的に ls する
function chpwd() {
  ls
}

# ssh known_hosts completion
# http://trashbox.g.hatena.ne.jp/lurker/20071109/1194586015
function print_known_hosts (){
  if [ -f $HOME/.ssh/known_hosts ]; then
    cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
  fi
}
_cache_hosts=($( print_known_hosts ))

# sudo vim filename を vim sudo:filename に展開する設定
# http://blog.monoweb.info/article/2011120320.html
sudo() {
  local args
  case $1 in
    vi|vim)
      args=()
      for arg in $@[2,-1]
      do
        if [ $arg[1] = '-' ]; then
          args[$(( 1+$#args ))]=$arg
        else
          args[$(( 1+$#args ))]="sudo:$arg"
        fi
      done
      command vim $args
      ;;
    *)
      command sudo $@
      ;;
  esac
}

# bundler-exec.sh
[ -f ~/.zsh/functions/_bundler-exec.sh ] && source ~/.zsh/functions/_bundler-exec.sh

## grep options
# export GREP_OPTIONS='--color=auto -E'

# tmux-powerline current dir
TMUX_DIRNAME=$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")
PROMPT="${PROMPT}${TMUX_DIRNAME}"

# tmux doesn't support bracketed paste mode
# (( $+TMUX )) && unset zle_bracketed_paste

if [ $TERM == dumb -o $+TMUX ]; then
    unset zle_bracketed_paste
else
    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic
fi

## peco
command -v peco >/dev/null 2>&1 && source ~/.zsh/functions/peco.zsh

## GitHub Pull Request id finder
[ -f ~/.zsh/functions/_find-pr ] && source ~/.zsh/functions/_find-pr

## Completion configuration
#
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit && compinit -u

# PATH が重複しないようにするやつ
typeset -U path

## load user .zshrc configuration file#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
