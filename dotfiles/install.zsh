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
PLPATH="${HOME}/Library/Preferences"
ALPATH="${HOME}/Library/Application\ Support/Alfred"
VSPATH="${HOME}/Library/Application\ Support/Code/User"

mkdir -p ${ALPATH}
mkdir -p ${VSPATH}
mkdir -p ~/.cargo
mkdir -p ~/.config/nvim
mkdir -p ${HOME}/.config/karabiner

for abspath (${EXEPATH}/*); do
	filename=$(basename -- "$abspath");

	if [[ $filename = 'install.zsh' ]]; then continue ; fi;
	if [[ $filename = 'init.vim' ]]; then ln -sfnv $abspath ${HOME}/.config/nvim; continue; fi;
	if [[ $filename = '.rustcfg' ]]; then ln -sfnv $abspath ${HOME}/.cargo/config; continue; fi;
	if [[ $filename = 'Alfred.alfredpreferences' ]]; then ln -sfnv $abspath ${ALPATH}/; continue; fi;
	if [[ $filename = 'com.googlecode.iterm2.plist' ]]; then ln -sfnv $abspath ${PLPATH}/; continue; fi;
	if [[ $filename = 'com.knollsoft.Rectangle.plist' ]]; then ln -sfnv $abspath ${PLPATH}/; continue; fi;
	if [[ $filename = 'karabiner.json' ]]; then ln -sfnv $abspath ${HOME}/.config/karabiner; continue; fi;
	if [[ $filename = '.vscode_settings.json' ]]; then ln -sfnv $abspath ${VSPATH}/settings.json; continue; fi;
	if [[ $filename = '.vscode_keybindings.json' ]]; then ln -sfnv $abspath ${VSPATH}/keybindings.json; continue; fi;

	ln -sfnv $abspath ${HOME}/$filename;
done
