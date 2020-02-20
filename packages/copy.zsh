#! /usr/local/bin/zsh

EXEPATH=$0:A:h
npm list -g --depth 0 | sed '1d' | awk '{ print $2 }' > ${EXEPATH}/Npmfile
