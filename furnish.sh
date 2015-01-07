#!/bin/bash
############################
# .make.sh
# makes all necessary symlinks to files/dirs in ~/dotfiles,
# and moves old ones to ~/dotfiles_old
############################

dir=~/dotfiles                  # dotfiles dir
olddir=~/dotfiles_old           # old dotfiles backup dir
files="vimrc vim screenrc"        # files/dirs to symlink in ~

echo -n "Creating $olddir..."
mkdir -p $olddir
echo "done"

echo -n "Changing to $dir..."
cd $dir
echo "done"

for file in $files; do
    echo -n "Moving existing symlink to $file from ~ to $olddir..."
    mv ~/.$file ~/dotfiles_old/
    echo "done"
    echo -n "Creating symlink to $file in home directory..."
    ln -s $dir/$file ~/.$file
    echo "done"
done
