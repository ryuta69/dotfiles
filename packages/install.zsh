#! /usr/local/bin/zsh

CWD=`git rev-parse --show-prefix`
EXEPATH="packages/"
if [[ ${CWD} != ${EXEPATH} ]]; then echo 'Must execute in '${EXEPATH} && exit; fi;

brew tap homebrew/bundle
brew bundle

npm install -g $(cat Npmfile)
