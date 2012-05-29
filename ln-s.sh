for i in .zshrc .zsh .vimrc .vim .gvimrc .screenrc .tmux.conf .bashrc .gemrc .inputrc .pryrc
do
  if [ ! -e $HOME/$i ] ; then
    ln -fs $HOME/dotfiles/$i $HOME/$i
  fi
done

if [ ! -e $HOME/dotfiles/.vim/bundle/vimproc/.git/hooks/post-receive ] ; then
  ln -fs $HOME/dotfiles/hooks/vimproc-post-receive $HOME/dotfiles/.vim/bundle/vimproc/.git/hooks/post-receive
fi
