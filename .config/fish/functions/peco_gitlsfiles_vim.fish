function peco_gitlsfiles_vim
  git ls-files | peco --query "$LBUFFER" | read selected
  if [ $selected ]
    vim $selected
  end
end
