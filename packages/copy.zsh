#! /usr/local/bin/zsh

DOTPATH="~/.ghq/github.com/ryuta69/dotfiles/packages"
if [[ $PWD != ${DOTPATH} ]]; then echo 'Must execute in '${DOTPATH} && exit; fi;

npm list -g --depth 0 | sed '1d' | awk '{ print $2 }' > ${DOTPATH}/Npmfile
