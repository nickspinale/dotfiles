export VISUAL=vim
export EDITOR=$VISUAL
export VIM=/home/nick/dotfiles/config/vim
export VIMRUNTIME=/home/nick/vim-runtime/runtime
export GIT_SSL_NO_VERIFY=true

basedir=$HOME/dotfiles/config/shell

PATH=$basedir/bin:$PATH

if test -d $HOME/bin; then
    PATH=$HOME/bin:$PATH
fi

for script in $basedir/sh/util/*.sh; do
    source $script
done