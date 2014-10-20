#!/bin/bash

shellyEditor_vim(){
  clog 2 "[shellyEditor_vim()]" Setting link for .vim
  if [ -e ~/.vim -a \( ! -L ~/.vim \) ]; then
    clog 1 "[shellyEditor_vim()]" ~/.vim exists but is no symbolic link. Won\'t remove!
    return 1
  elif [ -e ~/.vim -a -L ~/.vim ]; then
    rm ~/.vim || {
      clog 1 "[shellyEditor_vim()]" Could not remove ~/.vim!
      return 1
    }
  else
    # just for code cuteness. This case does not require
    # any action!
  fi
  
  ln -s $PWD/vim/dotVim ~/.vim || {
    clog 1 "[shellyEditor_vim()]" Link could not be set
    return 1
  }
  
  return 0
}

shellyEditor_vim
