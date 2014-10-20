#!/bin/bash

shellyEditorVim(){
  clog 2 "[shellyEditorVim()]" Setting link for .vim
  ln -s $PWD/vim/dotVim ~/.vim || {
    clog 1 "[shellyEditorVim()]" Link could not be set
    return 1
  }
  
  return 0
}

shellyEditorVim
