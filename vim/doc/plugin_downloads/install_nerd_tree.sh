#!/bin/bash
#Zweck: Installiert das NERD-Tree plugin für vim
##

cd ~/.vim/bundle/
rm -rf nerdtree
git clone https://github.com/scrooloose/nerdtree.git nerdtree
cd nerdtree
rm -rf .git
rm .gitignore
cd $OLDPWD
