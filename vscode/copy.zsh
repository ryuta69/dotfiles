#! /usr/local/bin/zsh

EXEPATH=$0:A:h
VSPATH="~/Library/Application\ Support/Code/User"
code --list-extensions > ${EXEPATH}/Pluginfile
