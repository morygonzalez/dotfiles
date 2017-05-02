# rbenv
set -x PATH $HOME/.rbenv/shims $PATH
if which rbenv > /dev/null
  rbenv init - fish | source
end

# Go
set -x GOPATH $HOME
set -x PATH $GOPATH/bin $PATH

# nodenv
if which nodenv > /dev/null
  nodenv init - fish | source
end

# Python
set -x PATH $HOME/Library/Python/2.7/bin $PATH

#peco
function fish_user_key_bindings
  fish_vi_key_bindings
  bind \cr peco_select_history
  bind -M insert \cr peco_select_history
  bind \cb peco_git_checkout
  bind -M insert \cb peco_git_checkout
  bind \c] peco_select_repository
  bind -M insert \c] peco_select_repository
  bind \ce peco_ec2ls
  bind -M insert \ce peco_ec2ls
end

function fish_prompt
  if set -q TMUX; tmux setenv TMUXPWD_(tmux display -p "#D" | tr -d '%') $PWD; end
end
