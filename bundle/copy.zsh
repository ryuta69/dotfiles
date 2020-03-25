#! /usr/local/bin/zsh

EXEPATH=$0:A:h

## ----------------------------------------
##	VSCode plugins
## ----------------------------------------
code --list-extensions > ${EXEPATH}/Pluginfile

## ----------------------------------------
##	Npm global packages
## ----------------------------------------
npm list -g --depth 0 | sed '1d' | awk '{ print $2 }' | awk -F'@[0-9]' '{ print $1 }' > ${EXEPATH}/Npmfile
