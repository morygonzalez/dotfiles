set -x EDITOR vim

# rbenv
if which rbenv > /dev/null
  rbenv init - fish | source
end

# Go
set -x GOPATH $HOME
set -U fish_user_paths $GOPATH/bin $fish_user_paths
set -x GOBIN $GOPATH/bin

# nodenv
if which nodenv > /dev/null
  status --is-interactive; and source (nodenv init -|psub)
end

# Python
set -U fish_user_paths $HOME/Library/Python/2.7/bin $fish_user_paths

#peco
function fish_user_key_bindings
  fish_vi_key_bindings
  bind \cr peco_select_history
  bind -M insert \cr peco_select_history
  bind \cb peco_git_checkout
  bind -M insert \cb peco_git_checkout
  bind \c] peco_select_repository
  bind -M insert \c] peco_select_repository
  bind \cx\cs peco_ec2ls_production
  bind -M insert \cx\cs peco_ec2ls_production
  bind \cx\ca peco_ec2ls_development
  bind -M insert \cx\ca peco_ec2ls_development
  bind \cg\cp peco_github_prs
  bind -M insert \cg\cp peco_github_prs
  bind \co peco_bundle_open
  bind -M insert \co peco_bundle_open
end

source ~/.config/fish/config.local.fish

# alias
alias tmux="tmux -2 -f ~/.tmux/osx.conf"
alias diff="colordiff"
