#! /usr/local/bin/zsh

setopt globdots

DOTPATH="~/.ghq/github.com/ryuta69/dotfiles/rcfiles"
if [[ $PWD != ${DOTPATH} ]]; then echo 'Must execute in '${DOTPATH} && exit; fi;

read Ans"?Your file will be overwritten(Y/n): "
if [[ $Ans != 'Y' ]]; then echo 'Canceled\n' && exit; fi;

for abspath (${PWD}/*); do
	filename=$(basename -- "$abspath");

	if [[ $filename = 'install.zsh' ]]; then continue ; fi;
	if [[ $filename = 'init.vim' ]]; then ln -sfnv $abspath ~/.config/nvim/init.vim ; fi;

	ln -sfnv $abspath ~/$filename;
done
