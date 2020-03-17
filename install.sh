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
			echo "init:     Core settings for all installations."
			echo "packages: Package manager installations."
			echo "dotfiles: Dotfiles installations."
			echo "vscode:   VSCode settings installations."
			echo "macos:    MacOS settings installations."
			echo "all:      All installations (except init)."
			exit 0
		fi

		if [[ "$1" =~ 'all' ]]; then
        		read -p "Your file will be overwritten(Y/n): " Ans;
        		if [[ $Ans != 'Y' ]]; then echo 'Canceled' && exit; fi;
			./packages/install.zsh --force
			./dotfiles/install.zsh --force
			./vscode/install.zsh --force
			./macos/install.zsh --force
			exit 0
		fi

		if [[ "$1" =~ 'init' ]]; then
			xcode-select --install

			mkdir -p ${HOME}work

			mkdir -p ${HOME}.ssh
			ssh-keyscan -t rsa github.com >> ${HOME}.ssh/known_hosts

			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
			brew tap homebrew/bundle

			brew install zsh
			sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
        		sudo chsh -s /usr/local/bin/zsh
			chmod 755 /usr/local/share/zsh
			chmod 755 /usr/local/share/zsh/site-functions
		fi

		if [[ "$1" =~ 'packages' ]]; then
			./packages/install.zsh
		fi

		if [[ "$1" =~ 'dotfiles' ]]; then
			./dotfiles/install.zsh
		fi

		if [[ "$1" =~ 'vscode' ]]; then
			./vscode/install.zsh
		fi

		if [[ "$1" =~ 'macos' ]]; then
			./macos/install.zsh
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
