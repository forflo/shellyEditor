#!/bin/bash

shellyEditor_init(){
  type clog > /dev/null || {
    echo "[shellyEditor_init()]" Could not find logging function. Will define one!
    function clog(){
      shift; echo "$@"; return 0
    }
  }

  return 0
}

shellyEditor_vim(){
  if [ -e ~/.vim -a \( ! -L ~/.vim \) ]; then
    clog 1 "[shellyEditor_vim()]" ~/.vim exists but is no symbolic link. Won\'t remove!
    return 1
  elif [ -L ~/.vim ]; then
    clog 2 "[shellyEditor_vim()]" ~/.vim exists and is a symlink. Removing...
    rm ~/.vim || {
      clog 1 "[shellyEditor_vim()]" Could not remove ~/.vim!
      return 1
    }
  else
    # just for code cuteness. This case does not require
    # any action!
   :
  fi

  if [ -e ~/.vimrc -a \( ! -L ~/.vimrc \) ]; then
    clog 1 "[shellyEditor_vim()]" .vimrc exists but is no symbolic link. Won\'t remove!
    return 1
  elif [ -L ~/.vimrc ]; then
    clog 2 "[shellyEditor_vim()]" .vimrc exists and is symbolic link! Removing...
    rm ~/.vimrc || {
      clog 1 "[shellyEditor_vim()]" ~/.vimrc could not be removed!
      return 1
    }
  else
   # nothing 
    :
  fi

  clog 2 "[shellyEditor_vim()]" Setting link for .vimrc
  ln -s $PWD/vim/vimrc ~/.vimrc || {
    clog 1 "[shellyEditor_vim()]" Link could not be set
    return 1
  }
  
  clog 2 "[shellyEditor_vim()]" Setting link for folder .vim
  ln -s $PWD/vim/dotVim ~/.vim || {
    clog 1 "[shellyEditor_vim()]" Link could not be set
    return 1
  }
  
  return 0
}

shellyEditor_main(){
  shellyEditor_init || {
    clog 1 "[shellyEditor_main()]" Could not initialize vim routines
    return 1
  }

  shellyEditor_vim || {
    clog 1 "[shellyEditor_main()]" Could not execute vim routines
    return 1
  }

  return 0
}

shellyEditor_main
