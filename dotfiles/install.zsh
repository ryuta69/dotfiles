#! /usr/local/bin/zsh

setopt globdots
local -A opthash
zparseopts -D -A opthash -- -force -help

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
mkdir -p ~/.cargo
mkdir -p ~/.config/nvim

for abspath (${EXEPATH}/*); do
	filename=$(basename -- "$abspath");

	if [[ $filename = 'install.zsh' ]]; then continue ; fi;
	if [[ $filename = '.rustcfg' ]]; then ln -sfnv $abspath ${HOME}/.cargo/config ; fi;
	if [[ $filename = 'init.vim' ]]; then ln -sfnv $abspath ${HOME}/.config/nvim/init.vim ; fi;
	if [[ $filename = '.vscode_settings.json' ]]; then ${VSPATH}/settings.json ; fi;
	if [[ $filename = '.vscode_keybindings.json' ]]; then ${VSPATH}/keybindings.json ; fi;


	ln -sfnv $abspath ${HOME}/$filename;
done
