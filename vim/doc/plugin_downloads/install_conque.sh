#!/bin/bash
#Zweck: Installiert das VIM-Plugin Conque
#	Siehe: http://code.google.com/p/conque/
##

cd ~/.vim/bundle/
svn co http://conque.googlecode.com/svn/trunk conque
cd $OLDPWD
