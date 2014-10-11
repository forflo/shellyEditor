#!/bin/bash
#Zweck: Installiert das Vim-Plugin Syntastic
#	https://github.com/scrooloose/syntastic.git
##

cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git
rm -rf .git
rm .gitignore
cd $OLDPWD

