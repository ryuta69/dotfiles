#! /usr/local/bin/zsh

local -A opthash
zparseopts -D -A opthash -- -force -help

if [[ -n ${opthash[(i)--help]} ]]; then
        echo "Add option --force to install without checking." && exit;
fi

if [[ -z ${opthash[(i)--force]}  ]]; then
        read Ans"?Your file will be overwritten(Y/n): ";
        if [[ $Ans != 'Y' ]]; then echo 'Canceled' && exit; fi;
fi

EXEPATH=$0:A:h

brew tap homebrew/bundle
brew bundle --file ${EXEPATH}/Brewfile

npm install -g $(cat ${EXEPATH}/Npmfile)
