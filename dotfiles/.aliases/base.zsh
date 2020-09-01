## ----------------------------------------
##	Vim
## ----------------------------------------
vim-plug-install() {
	vim  +'PlugInstall --sync' +qa
	nvim +'PlugInstall --sync' +qa
}
vim-plug-update() {
	vim  +'PlugUpdate --sync' +qa
	nvim +'PlugUpdate --sync' +qa
}
vim-plug-clean() {
	vim  +'PlugClean --sync' +qa
	nvim +'PlugClean --sync' +qa
}

## ----------------------------------------
##	Brew
## ----------------------------------------
brew-install() {
	brew bundle --file ./Brewfile
}
brew-update() {
	brew update
	brew upgrade
	brew cask upgrade
}
brew-clean() {
	brew bundle cleanup --file ./Brewfile
}
brew-list() {
	brew bundle dump > ./Brewfile
}

## ----------------------------------------
##	Tmux
## ----------------------------------------
tmux-plug-intall() {
	/bin/bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh
}
tmux-plug-update() {
	/bin/bash ~/.tmux/plugins/tpm/scripts/update_plugins.sh
}
tmux-plug-clean() {
	/bin/bash ~/.tmux/plugins/tpm/scripts/clean_plugins.sh
}

## ----------------------------------------
##	VSCode
## ----------------------------------------
vscode-plug-install() {
	# This also updates.
	plugins=($(cat ./Vsplug))
	for plugin in ${plugins}; do
		code --install-extension ${plugin}
	done
}
vscode-plug-clean() {
	plugin=$(cat ./Vsplug | fzf)
	code --uninstall-extension ${plugin}
}
vscode-plug-list() {
	code --list-extensions > ./bundle/Vsplug
}

## ----------------------------------------
##	Zinit
## ----------------------------------------
zinit-plug-install() {
	source ~/.zshrc
}
zinit-plug-update() {
	zinit self-update
	zinit update
}
zinit-plug-clean() {
	zinit clean
}

## ----------------------------------------
##	Npm
## ----------------------------------------
npm-install() {
	npm install -g $(cat ./Npmfile)
}
npm-update() {
	npm update -g npm
	npm update -g
}

## ----------------------------------------
##	Pip
## ----------------------------------------
pip-install() {
	pip3 install -r ./Pipfile
}
pip-update() {
	pip install --upgrade pip
	pip freeze | cut -d'=' -f1 | xargs -n1 pip install --upgrades
}

## ----------------------------------------
##	ssh
## ----------------------------------------
sshp() {
	HOST=grep "Host" ~/.ssh/config | fzf | awk "{ print \$2 }";
	ssh ${HOST};
}

## ----------------------------------------
##	Install Github Release
## ----------------------------------------
dlgr() {
	read repo"?type <author>/<repo> : ";
	URL=`curl -s "${repo}" | grep "browser_download_url" | cut -d '"' -f 4 | fzf`
	curl -sOL ${URL}
}

## ----------------------------------------
##	System Colors
## ----------------------------------------
alias pw='python -m pywal -i'

## ----------------------------------------
##	tar
## ----------------------------------------
tz() { tar zcvf "$1.tar.gz" "$1"; }
extract() {
	case "$1" in
		*.tar.gz|*.tgz)  tar xzvf   "$1";;
		*.tar.xz)        tar Jxvf   "$1";;
		*.zip)           unzip      "$1";;
		*.lzh)           lha e      "$1";;
		*.tar.bz2|*.tbz) tar xjvf   "$1";;
		*.tar.Z)         tar zxvf   "$1";;
		*.gz)            gzip -d    "$1";;
		*.bz2)           bzip2 -dc  "$1";;
		*.Z)             uncompress "$1";;
		*.tar)           tar xvf    "$1";;
		*.arj)           unarj      "$1";;
	esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
