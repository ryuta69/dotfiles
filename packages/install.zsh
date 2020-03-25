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
source ${HOME}/.cargo/env
rustup component add rls --toolchain stable
rustup component add rust-src --toolchain stable
rustup component add rls-preview --toolchain stable
rustup component add rust-analysis --toolchain stable

## ----------------------------------------
##	Xcode
## ----------------------------------------
sudo xcodebuild -license accept

## ----------------------------------------
##	Git
## ----------------------------------------
sudo ln -sfnv /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

## ----------------------------------------
##	Tmux
## ----------------------------------------
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## ----------------------------------------
##	MySQL
## ----------------------------------------
# mysql_secure_installation

## ----------------------------------------
##	iTerm2
## ----------------------------------------
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

## ----------------------------------------
##	Neovim
## ----------------------------------------
mkdir -p ${HOME}/.config/nvim
curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
