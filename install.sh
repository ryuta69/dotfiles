#!/bin/bash

declare -i argc=0
declare -a argv=()

while (( $# > 0 ))
do
	case $1 in
	-*)
		if [[ "$1" =~ 'help' ]]; then
			echo ""
			echo "ᓚᘏᗢ < This is my personal dotfiles."
			echo ""
			echo "Options for install.sh"
			echo "================================================="
			echo "init:     Core initialization"
			echo "bundle:   Package installation"
			echo "system:   MacOS system setting"
			echo "dotfiles: Dotfiles installation"
			echo "all:      All installations (except init)"
			exit 0
		fi

		if [[ "$1" =~ 'all' ]]; then
        		read -p "Your file will be overwritten(Y/n): " Ans;
        		if [[ $Ans != 'Y' ]]; then echo 'Canceled' && exit; fi;
			./bundle/install.zsh --force
			./dotfiles/install.zsh --force
			./system/install.zsh --force
			exit 0
		fi

		if [[ "$1" =~ 'init' ]]; then
			sudo -v
			while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

			touch ${HOME}/.hushlogin
			mkdir -p ${HOME}/work
			mkdir -p ${HOME}/.ssh

			xcode-select --install

			ssh-keygen -t rsa -b 4096 -C "eyma22s.yu@gmail.com"
			ssh-keyscan -t rsa github.com >> ${HOME}/.ssh/known_hosts
			# API with password will be deprecated in Nov 2020.
			# curl -u "ryuta69" --data "{\"title\":\"NewSSHKey\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" https://api.github.com/user/keys

			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
			brew tap homebrew/bundle

			brew install zsh
			sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
        		sudo chsh -s /usr/local/bin/zsh
			chmod 755 /usr/local/share/zsh
			chmod 755 /usr/local/share/zsh/site-functions
		fi

		if [[ "$1" =~ 'bundle' ]]; then
			./bundle/install.zsh
		fi

		if [[ "$1" =~ 'dotfiles' ]]; then
			./dotfiles/install.zsh
		fi

		if [[ "$1" =~ 'system' ]]; then
			./system/install.zsh
		fi

		shift
		;;
	*)
		((++argc))
		argv=("${argv[@]}" "$1")
		shift
		;;
	esac
done

## ----------------------------------------
##	Makefile
##	- This initialize was used to be made with Makefile.
##	- However, I noticed that make doesn't exist in default OS.
##	- I leave code here ust for reference.
## ----------------------------------------

# help:
# 	@echo "\nᓚᘏᗢ < This is my personal dotfiles.\n"
# 	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-10s: %s\n", $$1, $$2}'

# init: ## install dependencies.
# 	mkdir -p ~/.ssh
# 	mkdir -p ~/work
# 	mkdir -p ~/.config/nvim
# 	xcode-select --install
# 	ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
# 	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# 	brew install zsh
# 	sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
# 	sudo chsh -s /usr/local/bin/zsh
# 	chmod 755 /usr/local/share/zsh
# 	chmod 755 /usr/local/share/zsh/site-functions
# 	brew tap homebrew/bundle
# 	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# bundle: ## install package manager files.
# 	./bundle/install.zsh

# dotfiles: ## install dotfiles.
# 	./dotfiles/install.zsh

# system: ## install MacOS settings.
# 	./system/install.zsh

# all: ## install all settings.
# 	@echo "Your file will be overwritten(Y/n)" && read ans && [ $${ans:-N} = Y ]
# 	./bundle/install.zsh --force
# 	./dotfiles/install.zsh --force
# 	./system/install.zsh --force
