#! /usr/local/bin/zsh

CWD=`git rev-parse --show-prefix`
EXEPATH="packages/"
if [[ ${CWD} != ${EXEPATH} ]]; then echo 'Must execute in '${EXEPATH} && exit; fi;

VSPATH="~/Library/Application\ Support/Code/User"
ln -sfnv ${PWD}/settings.json ${VSPATH}/settings.json
ln -sfnv ${PWD}/keybindings.json ${VSPATH}/keybindings.json

code --install-extension $(cat PluginFile)
