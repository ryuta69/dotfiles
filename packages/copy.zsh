export DOTPATH=~/.ghq/github.com/ryuta69/dotfiles

npm list -g --depth 0 | sed '1d' | awk '{ print $2 }' > ${DOTPATH}/packages/Npmfile
