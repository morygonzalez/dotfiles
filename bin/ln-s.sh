export FILES=".zshrc .zsh .vimrc .vim .gvimrc .screenrc .tmux.conf .tmux .bashrc .gemrc .inputrc .pryrc .tigrc .ackrc .bundler .emacs.d .peco .tmux-powerlinerc .config"
for i in $FILES
do
  if [ ! -e $HOME/$i ] ; then
    ln -fs $HOME/src/github.com/morygonzalez/dotfiles/$i $HOME/$i
  fi
done
