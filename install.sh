#!/bin/bash

if [ -f $HOME/.vimrc ]; then
	mv -i $HOME/.vimrc $HOME/.vimrc.bak
fi
if [ -f `pwd`/vimrc ]; then
	ln -si `pwd`/vimrc $HOME/.vimrc
fi

if [ ! -d $HOME/.vim ]; then
    mkdir $HOME/.vim
fi
ln -si ./dotvim/autoload $HOME/.vim/autoload
ln -si ./dotvim/bundle $HOME/.vim/autoload
ln -si ./dotvim/colors $HOME/.vim/colors
