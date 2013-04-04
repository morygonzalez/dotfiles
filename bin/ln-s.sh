export FILES=".zshrc .zsh .vimrc .vim .gvimrc .screenrc .tmux.conf .tmux .bashrc .gemrc .inputrc .pryrc .tigrc .ackrc"
for i in $FILES
do
  if [ ! -e $HOME/$i ] ; then
    ln -fs $HOME/dotfiles/$i $HOME/$i
  fi
done
