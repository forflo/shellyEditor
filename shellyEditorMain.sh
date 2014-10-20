#!/bin/bash
#
# Configures the environment for both big editors:
# Emacs and vim
##
SHELLYE_subdirs=(
  "vim"
  "emacs"
)

shellyEditorMain(){
  for i in ${SHELLYE_subdirs[*]}; do
    . $i/init.sh || {
      clog 1 "[shellyEditor_init()]" Sourcing of $i/init.sh failed!
      return 1
    }
  done
  
  return 0
}

shellyEditorMain
