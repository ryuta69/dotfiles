#! /usr/local/bin/zsh

CWD=`git rev-parse --show-prefix`
EXEPATH="packages/"
if [[ ${CWD} != ${EXEPATH} ]]; then echo 'Must execute in '${EXEPATH} && exit; fi;

VSPATH="~/Library/Application\ Support/Code/User"
cp ${VSPATH}/settings.json ./
cp ${VSPATH}/keybindings.json ./
code --list-extensions > ./plugins.txt
