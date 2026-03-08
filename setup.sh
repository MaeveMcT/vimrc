#!/bin/bash

# Don't symlink these so don't save work stuff etc on here
echo "Copying .*rc files, not symlinking"
cp $PWD/.bashrc $HOME/.bashrc
cp $PWD/.zshrc $HOME/.zshrc

ln -s $PWD/.config/* $HOME/.config/

ln -s $PWD/nvim $HOME/.config/

ln -s $PWD/.ideavimrc $HOME/.ideavimrc

ln -s $PWD/.tmux.conf $HOME/.tmux.conf

ln -s $PWD/.gitconfig $HOME/.gitconfig
