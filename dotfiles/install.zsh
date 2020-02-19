#! /usr/local/bin/zsh

setopt globdots

CWD=`git rev-parse --show-prefix`
EXEPATH="dotfiles/"
if [[ ${CWD} != ${EXEPATH} ]]; then echo 'Must execute in '${EXEPATH} && exit; fi;

read Ans"?Your file will be overwritten(Y/n): "
if [[ $Ans != 'Y' ]]; then echo 'Canceled\n' && exit; fi;

for abspath (${PWD}/*); do
	filename=$(basename -- "$abspath");

	if [[ $filename = 'aliases' ]]; then continue ; fi;
	if [[ $filename = 'install.zsh' ]]; then continue ; fi;
	if [[ $filename = 'init.vim' ]]; then ln -sfnv $abspath ~/.config/nvim/init.vim ; fi;

	ln -sfnv $abspath ~/$filename;
done

sudo ln -sfnv /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
