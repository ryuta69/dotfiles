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

## ----------------------------------------
##	Brew Bundle
## ----------------------------------------
brew upgrade
brew bundle --file ${EXEPATH}/Brewfile
git lfs install

## ----------------------------------------
##	Npm Bundle
## ----------------------------------------
npm update -g npm
npm install -g $(cat ${EXEPATH}/Npmfile)

## ----------------------------------------
##	Pip Bundle
## ----------------------------------------
pip3 install --upgrade pip
pip3 install -r ${EXEPATH}/Pipfile

## ----------------------------------------
##	Rust Bundle
## ----------------------------------------
rustup-init -y
source ~/.cargo/env
rustup component add rls --toolchain stable
rustup component add rust-src --toolchain stable
rustup component add rls-preview --toolchain stable
rustup component add rust-analysis --toolchain stable

## ----------------------------------------
##	Git
## ----------------------------------------
sudo ln -sfnv /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

## ----------------------------------------
##	MySQL
## ----------------------------------------
# mysql_secure_installation

## ----------------------------------------
##	Neovim
## ----------------------------------------
mkdir -p ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
