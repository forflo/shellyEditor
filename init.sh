#!/bin/bash
#
# Configures the environment for both big editors:
# Emacs and vim
##

SUBDIRS=(
	"vim"
	"emacs"
)

for i in ${SUBDIRS[*]}; do
	. $i/init.sh || {
		clog 1 "[shellyEditor_init()]" Sourcing of $i/init.sh failed!
	}
done

exit 0
