#! /usr/local/bin/zsh

setopt globdots
local -A opthash
zparseopts -D -A opthash -- -force -help -test

if [[ -n "${opthash[(i)--help]}" ]]; then
        echo "Add option --force to install without checking." && exit;
fi

if [[ -z "${opthash[(i)--force]}"  ]]; then
        read Ans"?Your file will be overwritten(Y/n): "
        if [[ $Ans != 'Y' ]]; then echo 'Canceled\n' && exit; fi;
fi;

EXEPATH=$0:A:h
VSPATH="${HOME}/Library/Application\\\ Support/Code/User"
mkdir -p ${VSPATH}
ln -sfnv ${EXEPATH}/settings.json ${VSPATH}/settings.json
ln -sfnv ${EXEPATH}/keybindings.json ${VSPATH}/keybindings.json

if [[ -z "${opthash[(i)--test]}" ]]; then
	plugins=($(cat ${EXEPATH}/Pluginfile))
	for plugin in ${plugins}; do
		echo ${plugin}
		code --install-extension ${plugin}
	done
fi;
