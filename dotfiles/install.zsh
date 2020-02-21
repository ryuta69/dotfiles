#! /usr/local/bin/zsh

setopt globdots
local -A opthash
zparseopts -D -A opthash -- -force -help -test

if [[ -n "${opthash[(i)--help]}" ]]; then
        echo "Add option --force to install without checking." && exit;
fi

if [[ -z "${opthash[(i)--force]}"  ]]; then
        read Ans"?Your file will be overwritten(Y/n): "
        if [[ $Ans != 'Y' ]]; then echo 'Canceled\n' && exit;
fi;

EXEPATH=$0:A:h
for abspath (${EXEPATH}/*); do
	filename=$(basename -- "$abspath");

	if [[ $filename = 'aliases' ]]; then continue ; fi;
	if [[ $filename = 'install.zsh' ]]; then continue ; fi;
	if [[ $filename = 'init.vim' ]]; then ln -sfnv $abspath ~/.config/nvim/init.vim ; fi;

	ln -sfnv $abspath ~/$filename;
done

sudo ln -sfnv /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
chsh -s /usr/local/bin/zsh
