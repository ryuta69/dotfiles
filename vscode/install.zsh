#! /usr/local/bin/zsh

EXEPATH=$0:A:h
VSPATH="~/Library/Application\ Support/Code/User"
ln -sfnv ${EXEPATH}/settings.json ${VSPATH}/settings.json
ln -sfnv ${EXEPATH}/keybindings.json ${VSPATH}/keybindings.json

code --install-extension $(cat ${EXEPATH}/Pluginfile)
