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
brew unlink node
brew bundle --file ${EXEPATH}/Brewfile
git lfs install
rustup-init

## ----------------------------------------
##	Npm Bundle
## ----------------------------------------
npm update -g npm
npm install -g $(cat ${EXEPATH}/Npmfile)

## ----------------------------------------
##	Pip Bundle
## ----------------------------------------
pip install --upgrade pip
pip install -r ${EXEPATH}/Pipfile

## ----------------------------------------
##	Rust Bundle
## ----------------------------------------
curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup install nightly
rustup default nightly
rustup component add rls-preview --toolchain nightly
rustup component add rust-analysis --toolchain nightly
rustup component add rust-src --toolchain nightly
cargo install rustsym

## ----------------------------------------
##	MySQL Bundle
## ----------------------------------------
# mysql_secure_installation
