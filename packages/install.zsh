#! /usr/local/bin/zsh

DOTPATH="~/.ghq/github.com/ryuta69/dotfiles/packages"
if [[ $PWD != ${DOTPATH} ]]; then echo 'Must execute in '${DOTPATH} && exit; fi;

brew tap homebrew/bundle
brew bundle

npm install -g $(cat Npmfile)
