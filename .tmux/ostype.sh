case "${OSTYPE}" in
  darwin*)
    # pbcopy と pbpasete 復活
    echo 'set-option -g default-command "reattach-to-user-namespace -l zsh"'
esac
