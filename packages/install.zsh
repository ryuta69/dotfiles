#! /usr/local/bin/zsh

EXEPATH=$0:A:h

brew tap homebrew/bundle
brew bundle --file ${EXEPATH}/Brewfile

npm install -g $(cat ${EXEPATH}/Npmfile)
