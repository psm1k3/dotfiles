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
ln -si `pwd`/dotvim/autoload $HOME/.vim/autoload
ln -si `pwd`/dotvim/bundle $HOME/.vim/autoload
ln -si `pwd`/dotvim/colors $HOME/.vim/colors
