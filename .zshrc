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
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
esac

# VCS branch name
# http://d.hatena.ne.jp/mollifier/20100906/p1
autoload -U add-zsh-hook
autoload -U vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -U is-at-least
if is-at-least 4.3.10; then
  # この check-for-changes が今回の設定するところ
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"  # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi

add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{green}%1v%f|)"

function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

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


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
#   to end of it)
#
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
# history-incremental-pattern-search
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups   # ignore duplication command history list
setopt share_history    # share command history data


## Completion configuration
#
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit -u


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
setopt complete_aliases   # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
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

# command ranking
alias cr="perl -pe 's/.+;//' ~/.zsh_history | awk 'BEGIN {FS=\"|\"} {print $1}' | sort | uniq -c | sort -nr | head -10"

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
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=Exfxcxdxbxegedabagacad
  export LS_COLORS='di=34;01:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34;01' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
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

function chpwd() {
  ls
}

# sudo vim filename を vim sudo:filename に展開する設定
sudo() {
  local args
  case $1 in
    vi|vim)
      args=()
      for arg in $@[2,-1]
      do
        args[$(( 1+$#args ))]="sudo:$arg"
      done
      command vim $args
      ;;
    *)
      command sudo $@
      ;;
  esac
}

## load git-completion.sh
autoload bashcompinit
bashcompinit
[ -f ~/.git-completion.sh ] && source ~/.git-completion.sh

# bundler-exec.sh
[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh

## load user .zshrc configuration file#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
