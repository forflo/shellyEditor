#!/bin/bash
#Zweck: Installiert pathogen als Basis des
#	Pluginmanagements
##

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -o ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo 'execute pathogen#infect()' >> ~/.vimrc


