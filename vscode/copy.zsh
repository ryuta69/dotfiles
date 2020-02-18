#! /usr/local/bin/zsh

DOTPATH="~/.ghq/github.com/ryuta69/dotfiles/vscode"
if [[ $PWD != ${DOTPATH} ]]; then echo 'Must execute in '${DOTPATH} && exit; fi;

VSPATH="~/Library/Application\ Support/Code/User"
cp ${VSPATH}/settings.json ${DOTPATH} &&
	code --list-extensions > ${DOTPATH}/plugins.txt &&
	cp ${VSPATH}/keybindings.json ${DOTPATH}
