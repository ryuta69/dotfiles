#! /usr/local/bin/zsh

EXEPATH=$0:A:h
setopt globdots
local -A opthash
zparseopts -D -A opthash -- -force -help

if [[ -n "${opthash[(i)--help]}" ]]; then
        echo "Add option --force to install without checking." && exit;
fi

if [[ -z "${opthash[(i)--force]}"  ]]; then
        read Ans"?Your file will be overwritten(Y/n): "
        if [[ $Ans != 'Y' ]]; then echo 'Canceled\n' && exit; fi;
fi

CRPATH="${HOME}/.cargo"                                && mkdir -p ${CRPATH}
NVPATH="${HOME}/.config/nvim"                          && mkdir -p ${NVPATH}
KRPATH="${HOME}/.config/karabiner"                     && mkdir -p ${KRPATH}
PLPATH="${HOME}/Library/Preferences"                   && mkdir -p ${PLPATH}
ALPATH="${HOME}/Library/Application Support/Alfred"    && mkdir -p ${ALPATH}
VSPATH="${HOME}/Library/Application Support/Code/User" && mkdir -p ${VSPATH}
SKIPLIST=("install.zsh" ".library" ".vscode" ".node_template")

for abspath (${EXEPATH}/*); do
	filename=$(basename -- "$abspath");
	if [[ ${SKIPLIST[(ie)$filename]} -le ${#SKIPLIST} ]]; then continue; fi;
	if [[ $filename = '.vimrc' ]]; then ln -sfnv $abspath ${NVPATH}/init.vim; fi;
	if [[ $filename = '.rustcfg' ]]; then ln -sfnv $abspath ${CRPATH}/config; continue; fi;
	ln -sfnv $abspath ${HOME};
done

for abspath (${EXEPATH}/.vscode/*); do
	ln -sfnv $abspath ${VSPATH};
done

for abspath (${EXEPATH}/.library/*); do
	filename=$(basename -- "$abspath");
	if [[ $filename = 'karabiner.json' ]]; then ln -sfnv $abspath ${KRPATH}; continue; fi;
	if [[ $filename = 'Alfred.alfredpreferences' ]]; then ln -sfnv $abspath ${ALPATH}; continue; fi;
	if [[ $filename = 'com.googlecode.iterm2.plist' ]]; then ln -sfnv $abspath ${PLPATH}; continue; fi;
	if [[ $filename = 'com.knollsoft.Rectangle.plist' ]]; then ln -sfnv $abspath ${PLPATH}; continue; fi;
done

if [[ -z "${opthash[(i)--test]}" ]]; then
	zinit self-update
	source ${HOME}/.zshrc
	vim  +'PlugInstall --sync' +qa
	nvim +'PlugInstall --sync' +qa
	${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh
fi
