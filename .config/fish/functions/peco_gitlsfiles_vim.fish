function peco_gitlsfiles_vim
  git ls-files -z | xargs -0 ls -t | peco --query "$LBUFFER" | read selected
  if [ $selected ]
    vim $selected
  end
end
