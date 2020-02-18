#! /usr/local/bin/zsh

CWD=`git rev-parse --show-prefix`
EXEPATH="packages/"
if [[ ${CWD} != ${EXEPATH} ]]; then echo 'Must execute in '${EXEPATH} && exit; fi;

npm list -g --depth 0 | sed '1d' | awk '{ print $2 }' > ./Npmfile
