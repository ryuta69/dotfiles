#! /usr/local/bin/zsh

EXEPATH=$0:A:h
VSPATH="~/Library/Application\ Support/Code/User"
cp ${VSPATH}/settings.json ${EXEPATH}
cp ${VSPATH}/keybindings.json ${EXEPATH}
code --list-extensions > ${EXEPATH}/plugins.txt
