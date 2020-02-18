#! /usr/local/bin/zsh

DOTPATH="~/.ghq/github.com/ryuta69/dotfiles/vscode"
if [[ $PWD != ${DOTPATH} ]]; then echo 'Must execute in '${DOTPATH} && exit; fi;

VSPATH="~/Library/Application\ Support/Code/User"
ln -sfnv ${DOTPATH}/settings.json ${VSPATH}/settings.json
ln -sfnv ${DOTPATH}/keybindings.json ${VSPATH}/keybindings.json

code --install-extension $(cat PluginFile)
