#!/bin/bash

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

EXEPATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)

symlink_dotfiles () {
	CWD=${EXEPATH}/dotfiles

	CRPATH="${HOME}/.cargo"                                && mkdir -p ${CRPATH}
	NVPATH="${HOME}/.config/nvim"                          && mkdir -p ${NVPATH}
	KRPATH="${HOME}/.config/karabiner"                     && mkdir -p ${KRPATH}
	PLPATH="${HOME}/Library/Preferences"                   && mkdir -p ${PLPATH}
	ALPATH="${HOME}/Library/Application Support/Alfred"    && mkdir -p ${ALPATH}
	VSPATH="${HOME}/Library/Application Support/Code/User" && mkdir -p ${VSPATH}
	SKIPLIST=("install.zsh" ".library" ".vscode" ".node_template")

	for abspath (${CWD}/*); do
		filename=$(basename -- "$abspath");
		if [[ ${SKIPLIST[(ie)$filename]} -le ${#SKIPLIST} ]]; then continue; fi;
		if [[ $filename = '.vsnip' ]]; then ln -sfnv $abspath ${VSPATH}/snippets; fi;
		if [[ $filename = '.vimrc' ]]; then ln -sfnv $abspath ${NVPATH}/init.vim; fi;
		if [[ $filename = '.rustcfg' ]]; then ln -sfnv $abspath ${CRPATH}/config; continue; fi;
		ln -sfnv $abspath ${HOME};
	done

	for abspath (${CWD}/.vscode/*); do
		ln -sfnv $abspath ${VSPATH};
	done

	for abspath (${CWD}/.library/*); do
		filename=$(basename -- "$abspath");
		if [[ $filename = 'karabiner.json' ]]; then ln -sfnv $abspath ${KRPATH}; continue; fi;
		if [[ $filename = 'Alfred.alfredpreferences' ]]; then ln -sfnv $abspath ${ALPATH}; continue; fi;
		if [[ $filename = 'com.googlecode.iterm2.plist' ]]; then ln -sfnv $abspath ${PLPATH}; continue; fi;
		if [[ $filename = 'com.knollsoft.Rectangle.plist' ]]; then ln -sfnv $abspath ${PLPATH}; continue; fi;
	done

	if [[ -z "${opthash[(i)--test]}" ]]; then
		zinit self-update
		source ${HOME}/.zshrc
		vim  +'PlugInstall --sync' +qa
		nvim +'PlugInstall --sync' +qa
		${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh
	fi
}

configure_system () {
	CWD=${EXEPATH}/system

	osascript -e 'tell application "System Preferences" to quit' > /dev/null 2>&1
	${CWD}/macos.sh

	if [[ -z "${opthash[(i)--test]}"  ]]; then
		for app in \
			"cfprefsd" \
			"Activity Monitor" "Address Book" "Calendar" \
			"Contacts" "Dock" "Finder" "Mail" "Messages" \
			"SystemUIServer" "Terminal" "Transmission" "iCal"
		do
			killall ${app}
		done
	fi
}

install_bundle () {
	CWD=${EXEPATH}/bundle

	## ----------------------------------------
	##	Brew Bundle
	## ----------------------------------------
	brew upgrade
	brew bundle --file ${CWD}/Brewfile

	## ----------------------------------------
	##	Xcode
	##      - Required to run after Brew,
	##      - because xcode is installed by Cask.
	## ----------------------------------------
	sudo xcodebuild -license accept

	## ----------------------------------------
	##	Npm Bundle
	##	- npm list -g --depth 0 | sed '1d' | awk '{ print $2 }' | awk -F'@[0-9]' '{ print $1 }' > Npmfile
	## ----------------------------------------
	npm update -g npm
	npm install -g $(cat ${CWD}/Npmfile)

	## ----------------------------------------
	##	Pip Bundle
	## ----------------------------------------
	pip3 install --upgrade pip
	pip3 install -r ${CWD}/Pipfile

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
	##	Perl Cpanm
	## ----------------------------------------
	cpanm App::cpanminus
	cpanm Perl::Tidy

	## ----------------------------------------
	##	Git
	## ----------------------------------------
	sudo ln -sfnv /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

	## ----------------------------------------
	##	Zsh
	## ----------------------------------------
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
	zinit self-update
	source ${HOME}/.zshrc

	## ----------------------------------------
	##	Vim
	## ----------------------------------------
	curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +'PlugInstall --sync' +qa
	curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +'PlugInstall --sync' +qa

	## ----------------------------------------
	##	Tmux
	## ----------------------------------------
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh

	## ----------------------------------------
	##	MySQL
	## ----------------------------------------
	# mysql_secure_installation

	## ----------------------------------------
	##	Gcloud
	## ----------------------------------------
	curl https://sdk.cloud.google.com | /bin/bash -s -- --disable-prompts

	## ----------------------------------------
	##	iTerm2
	## ----------------------------------------
	curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

	## ----------------------------------------
	##	Anyenv
	## ----------------------------------------
	if [ ! -d ${HOME}/.config/anyenv/anyenv-install ]; then
		expect -c "
			spawn anyenv install --init
			expect \"Do you want to checkout ? \[y\/N\]: \"
			send \"y\n\"
			expect eof
		"
	fi

	## ----------------------------------------
	##	Docker
	## ----------------------------------------
	mkdir -p ${HOME}/.zsh/completion
	curl -L https://raw.githubusercontent.com/docker/compose/1.25.4/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
	curl -L https://raw.githubusercontent.com/docker/machine/v0.16.0/contrib/completion/zsh/_docker-machine > ~/.zsh/completion/_docker-machine

	## ----------------------------------------
	##	VSCode
	##      - code --list-extensions > Vsplug
	## ----------------------------------------
	if [[ -z "${opthash[(i)--test]}" ]]; then
		plugins=($(cat ${CWD}/Vsplug))
		for plugin in ${plugins}; do
			code --install-extension ${plugin}
		done
	fi
}

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
			install_bundle
			symlink_dotfiles
			configure_system
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

			exec -l ${SHELL}
			git clone https://github.com/ryuta69/dotfiles
			cd dotfiles
		fi

		if [[ "$1" =~ 'bundle' ]]; then
			install_bundle
		fi

		if [[ "$1" =~ 'dotfiles' ]]; then
			symlink_dotfiles
		fi

		if [[ "$1" =~ 'system' ]]; then
			configure_system
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
