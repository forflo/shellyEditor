#!/bin/bash
#
# Configures the environment for both big editors:
# Emacs and vim
##
SHELLYE_subdirs=(
  "vim"
  "emacs"
)

shellyEditor_init(){
  type clog > /dev/null || {
    echo "[shellyEditor_init()]" Could not find logging function. Will define one!
    function clog(){
      shift; echo "$@"; return 0
    }
  }

  return 0
}

shellyEditor_start(){
  for i in ${SHELLYE_subdirs[*]}; do
    . $i/configure.sh || {
      clog 1 "[shellyEditor_start()]" Sourcing of $i/init.sh failed!
      return 1
    }
  done
  
  return 0
}

shellyEditor_main(){
  shellyEditor_init || {
    clog 1 "[shellyEditor_main()]" Could not initialize vim routines
    return 1
  }
  
  shellyEditor_start || {
    clog 1 "[shellyEditor_main()]" Could not start editor routines
    return 1
  }
}

shellyEditor_main
