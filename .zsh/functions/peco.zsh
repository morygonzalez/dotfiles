function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-git-checkout-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco --query "$LBUFFER")
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
}
zle -N peco-git-checkout-recent-branches
bindkey '^b' peco-git-checkout-recent-branches

function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function peco-bundle-open() {
    local selected=$(bundle show 2> /dev/null | sed -e '/^  \*/!d; s/^  \* \([^ ]*\) .*/\1/' | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        BUFFER="bundle open ${selected}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-bundle-open
bindkey '^o' peco-bundle-open
