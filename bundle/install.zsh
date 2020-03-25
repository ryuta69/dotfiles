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

## ----------------------------------------
##	Xcode
##      - Required to run after Brew,
##      - because xcode is installed by Cask.
## ----------------------------------------
sudo xcodebuild -license accept

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
##	Git
## ----------------------------------------
git lfs install
sudo ln -sfnv /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

## ----------------------------------------
##	Zsh
## ----------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
zinit self-update

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
##	Docker
## ----------------------------------------
mkdir -p ${HOME}/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/compose/1.25.4/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
curl -L https://raw.githubusercontent.com/docker/machine/v0.16.0/contrib/completion/zsh/_docker-machine > ~/.zsh/completion/_docker-machine

## ----------------------------------------
##	Neovim
## ----------------------------------------
curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## ----------------------------------------
##	VSCode
##      - Github Actions doesn't support this,
##      - because they don't have GUI,
##      - so option --test will avoid this.
## ----------------------------------------
if [[ -z "${opthash[(i)--test]}" ]]; then
	plugins=($(cat ${EXEPATH}/VscodePlugin))
	for plugin in ${plugins}; do
		code --install-extension ${plugin}
	done
fi;