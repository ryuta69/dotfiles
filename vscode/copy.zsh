#! /usr/local/bin/zsh

EXEPATH=$0:A:h
code --list-extensions > ${EXEPATH}/Pluginfile
