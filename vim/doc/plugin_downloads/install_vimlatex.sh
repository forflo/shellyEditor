#!/bin/bash
# currently only tested on mac
##

git clone http://git.code.sf.net/p/vim-latex/vim-latex vim_tex
cd vim_tex
mkdir ~/.vim/bundle/vim_latex
cp -r * ~/.vim/bundle/vim_latex

cd ..
rm -rf vim_tex
