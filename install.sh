#!/bin/bash

if [ -f $HOME/.vimrc ]; then
	mv $HOME/.vimrc $HOME/.vimrc.bak
fi
if [ -f `pwd`/vimrc ]; then
	ln -s `pwd`/vimrc $HOME/.vimrc
fi
