DOTFILES=$HOME/dotfiles
VIM_BUNDLE=$HOME/vim-bundle/bundle
MY_LOCAL=$HOME/local

if [ -d $HOME/vim-runtime ]; then
    VIMRUNTIME=$HOME/vim-runtime/runtime
else
    version=$(vim --version | head -n 1 | sed -E 's/^[^0-9]*([0-9]+)\.([0-9]+).*/\1\2/')
    fall_back=$(vim --version | grep fall-back | cut -d '"' -f 2)
    VIMRUNTIME=$fall_back/vim$version
fi

MY_PATH=$MY_LOCAL/bin:$DOTFILES/bin/darwin:$DOTFILES/bin
if [ -d $HOME/bin ]; then
    MY_PATH=$HOME/bin:$MY_PATH
fi

launchctl setenv EDITOR vim
launchctl setenv VISUAL vim

launchctl setenv VIM $DOTFILES/config/vim
launchctl setenv VIMRUNTIME $VIMRUNTIME # TODO
launchctl setenv FZF_DEFAULT_OPTS '--reverse'
launchctl setenv GIT_SSL_NO_VERIFY true

launchctl setenv DOTFILES $DOTFILES
launchctl setenv VIM_BUNDLE $VIM_BUNDLE
launchctl setenv MY_LOCAL $MY_LOCAL

launchctl setenv PATH $MY_PATH
launchctl setenv NIX_PATH $NIX_PATH:dotfig=$DOTFILES/config
