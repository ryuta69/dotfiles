#!/bin/bash

if [[ "$OSTYPE" != "darwin"* ]]; then
	echo "MacOS only available."
	exit 1
fi

shopt -s dotglob
TESTMODE=false
EXEPATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)

## ----------------------------------------
##	Functions
## ----------------------------------------
symlink_dotfiles() {
	CWD="${EXEPATH}"/dotfiles

	CRPATH="${HOME}/.cargo"                                && mkdir -p "${CRPATH}"
	NVPATH="${HOME}/.config/nvim"                          && mkdir -p "${NVPATH}"
	NEPATH="${HOME}/.config/neofetch"                      && mkdir -p "${NEPATH}"
	KRPATH="${HOME}/.config/karabiner"                     && mkdir -p "${KRPATH}"
	AAPATH="${HOME}/.config/alacritty"                     && mkdir -p "${AAPATH}"
	PLPATH="${HOME}/Library/Preferences"                   && mkdir -p "${PLPATH}"
	ALPATH="${HOME}/Library/Application Support/Alfred"    && mkdir -p "${ALPATH}"
	VSPATH="${HOME}/Library/Application Support/Code/User" && mkdir -p "${VSPATH}"
	UBPATH="${HOME}/Library/Application Support/Übersicht" && mkdir -p "${UBPATH}"
	SKIPLIST=(".library" ".vscode")

	for abspath in ${CWD}/*; do
		filename=$(basename -- "$abspath");
		if [[ ${SKIPLIST[@]} =~ $filename ]]; then continue; fi;
		if [[ $filename = '.vimrc' ]]; then ln -sfnv $abspath ${NVPATH}/init.vim; fi;
		if [[ $filename = '.snippets' ]]; then ln -sfnv $abspath ${VSPATH}/snippets; fi;
		if [[ $filename = '.rustcfg' ]]; then ln -sfnv $abspath ${CRPATH}/config; continue; fi;
		if [[ $filename = '.alacritty.yml' ]]; then ln -sfnv $abspath ${AAPATH}/alacritty.yml; fi;
		if [[ $filename = '.neofetch.conf' ]]; then ln -sfnv $abspath ${NEPATH}/config.conf; continue; fi;
		if [[ $filename = '.coc-settings.json' ]]; then ln -sfnv $abspath ${HOME}/coc-settings.json; continue; fi;
		ln -sfnv $abspath ${HOME};
	done

	for abspath in ${CWD}/.vscode/*; do
		ln -sfnv $abspath ${VSPATH};
	done

	for abspath in ${CWD}/.library/*; do
		filename=$(basename -- "$abspath");
		if [[ $filename = 'karabiner.json' ]]; then ln -sfnv $abspath ${KRPATH}; fi;
		if [[ $filename = 'ubersicht' ]]; then ln -sfnv $abspath ${UBPATH}/widgets; fi;
		if [[ $filename = 'Alfred.alfredpreferences' ]]; then ln -sfnv $abspath ${ALPATH}; fi;
		if [[ $filename = 'com.googlecode.iterm2.plist' ]]; then ln -sfnv $abspath ${PLPATH}; fi;
		if [[ $filename = 'com.knollsoft.Rectangle.plist' ]]; then ln -sfnv $abspath ${PLPATH}; fi;
	done

	if ! ${TESTMODE}; then
		zinit self-update
		source ${HOME}/.zshrc
		vim  +'PlugInstall --sync' +qa
		nvim +'PlugInstall --sync' +qa
		/bin/bash ${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh
	fi
}

configure_system() {
	CWD=${EXEPATH}/system
	osascript -e 'tell application "System Preferences" to quit' > /dev/null 2>&1
	/bin/bash ${CWD}/macos.sh ${TESTMODE}
}

install_bundle() {
	CWD=${EXEPATH}/bundle

	## ========== Brew Bundle ==========
	brew upgrade
	brew bundle --file ${CWD}/Brewfile

	## ========== Xcode ==========
	sudo xcodebuild -license accept

	## ========== Npm ==========
	## - npm list -g --depth 0 | sed '1d' | awk '{ print $2 }' | awk -F'@[0-9]' '{ print $1 }' > Npmfile
	npm update -g npm
	npm install -g $(cat ${CWD}/Npmfile)

	## ========== Pip ==========
	pip3 install --upgrade pip
	pip3 install -r ${CWD}/Pipfile

	## ========== Rust ==========
	rustup-init -y
	source ${HOME}/.cargo/env
	rustup component add rls --toolchain stable
	rustup component add rust-src --toolchain stable
	rustup component add rls-preview --toolchain stable
	rustup component add rust-analysis --toolchain stable
	crates=($(cat ${CWD}/Cargofile))
	for crate in ${crates}; do
		cargo install -f --git "${crate}"
	done

	## ========== Perl ==========
	PERL_MM_USE_DEFAULT=1 PERL_MM_OPT="INSTALL_BASE=$HOME/perl5" cpan local::lib
	eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
	cpan App::cpanminus
	cpanm $(cat ${CWD}/Cpanfile)

	## ========== Git ==========
	sudo ln -sfnv /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

	## ========== Zsh ==========
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
	zinit self-update
	source ${HOME}/.zshrc

	## ========== Vim ==========
	curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +'PlugInstall --sync' +qa
	curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +'PlugInstall --sync' +qa

	## ========== Tmux ==========
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	/bin/bash ${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh

	## ========== MySQL ==========
	# mysql_secure_installation
	# - This can be automated by expect, but can't be public.
	# - [Ref] https://gist.github.com/Mins/4602864

	## ========== Gcloud ==========
	curl https://sdk.cloud.google.com | /bin/bash -s -- --disable-prompts

	## ========== iTerm2 ==========
	curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

	## ========== Anyenv ==========
	# if [ ! -d ${HOME}/.config/anyenv/anyenv-install ]; then
	# 	expect -c "
	# 		spawn anyenv install --init
	# 		expect \"Do you want to checkout ? \[y\/N\]: \"
	# 		send \"y\n\"
	# 		expect eof
	# 	"
	# fi

	## ========== Yabai ==========
	# brew services start skhd
	# brew services start yabai
	# cd ${HOME}/Library/Application\ Support/Übersicht/widgets/status_bar
	# yarn install

	## ========== Docker ==========
	mkdir -p ${HOME}/.zsh/completion
	curl -L https://raw.githubusercontent.com/docker/compose/1.25.4/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
	curl -L https://raw.githubusercontent.com/docker/machine/v0.16.0/contrib/completion/zsh/_docker-machine > ~/.zsh/completion/_docker-machine

	## ========== Remote pbcopy ==========
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
		curl -fsSLo pbcopy-linux-amd64.tar.gz https://github.com/skaji/remote-pbcopy-iterm2/releases/latest/download/pbcopy-linux-amd64.tar.gz
		tar --remove-files xf pbcopy-linux-amd64.tar.gz
		mv pbcopy ~/pbcopy
	fi

	## ========== VSCode ==========
	## - code --list-extensions > Vsplug
	if ! ${TESTMODE}; then
		plugins=($(cat ${CWD}/Vsplug))
		for plugin in ${plugins}; do
			code --install-extension ${plugin}
		done
	fi
}

initialize() {
	if ! ${TESTMODE}; then
		xcode-select --install
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

		mkdir -p ${HOME}/.ssh
		ssh-keygen -t rsa -b 4096 -C "eyma22s.yu@gmail.com"
		ssh-keyscan -t rsa github.com >> ${HOME}/.ssh/known_hosts
		curl -u "ryuta69" --data "{\"title\":\"NewSSHKey\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" https://api.github.com/user/keys
	fi

	brew tap homebrew/bundle
	brew install zsh
	sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
	sudo chsh -s /usr/local/bin/zsh
	chmod 755 /usr/local/share/zsh
	chmod 755 /usr/local/share/zsh/site-functions
	mkdir -p ${HOME}/work

	! ${TESTMODE} && exec -l ${SHELL}
}

usage() {
	cat <<- EOS

		ᓚᘏᗢ < This is my personal dotfiles.

		Options for install.sh"
		================================================="
		init:     Core initialization"
		bundle:   Package installation"
		system:   MacOS system setting"
		dotfiles: Dotfiles installation"
		all:      All installations (except init)"

	EOS
}

## ----------------------------------------
##	Main
## ----------------------------------------
argv=$@

if [[ ${argv[@]} =~ "--help" || $# -eq 0 ]]; then
	usage
	exit 0
fi

if [[ ${argv[@]} =~ "--force" ]]; then
	argv=( ${argv[@]/"--force"} )
else
	read -p "Your file will be overwritten. OK? (Y/n): " Ans;
	[[ ${argv[@]} =~ "--init" ]] && Ans='Y';
	[[ $Ans != 'Y' ]] && echo 'Canceled' && exit 0;
fi

if [[ ${argv[@]} =~ "--test" ]]; then
	TESTMODE=true
	argv=( ${argv[@]/"--test"} )
fi

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

for opt in ${argv[@]}; do
	case $opt in
		--init)     initialize; ;;
		--bundle)   install_bundle; ;;
		--system)   configure_system; ;;
		--dotfiles) symlink_dotfiles; ;;
		--all)      install_bundle; symlink_dotfiles; configure_system; ;;
		*)          echo "invalid option $1"; ;;
	esac
done
