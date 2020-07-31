# All of this scripts are already inside aliases.

## ----------------------------------------
##	Vim
## ----------------------------------------
vim-plug-install:
	vim  +'PlugInstall --sync' +qa
	nvim +'PlugInstall --sync' +qa

vim-plug-update:
	vim  +'PlugUpdate --sync' +qa
	nvim +'PlugUpdate --sync' +qa

vim-plug-clean:
	vim  +'PlugClean --sync' +qa
	nvim +'PlugClean --sync' +qa

## ----------------------------------------
##	Brew
## ----------------------------------------
brew-install:
	brew bundle --file ./bundle/Brewfile

brew-update:
	brew update
	brew upgrade
	brew cask upgrade

brew-clean:
	brew bundle cleanup --file ./bundle/Brewfile

brew-list:
	brew bundle dump > ./bundle/Brewfile

## ----------------------------------------
##	Tmux
## ----------------------------------------
tmux-plug-install:
	/bin/bash ${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh

tmux-plug-update:
	/bin/bash ${HOME}/.tmux/plugins/tpm/scripts/update_plugins.sh

tmux-plug-clean:
	/bin/bash ${HOME}/.tmux/plugins/tpm/scripts/clean_plugins.sh

## ----------------------------------------
##	Zinit
## ----------------------------------------
zinit-plug-install:
	source ~/.zshrc

zinit-plug-update:
	zinit self-update
	zinit update

zinit-plug-update:
	zinit clean

## ----------------------------------------
##	VSCode
## ----------------------------------------
vscode-plug-install: # This also updates.
	plugins=($(cat ./bundle/Vsplug))
	for plugin in ${plugins}; do
		code --install-extension ${plugin}
	done

vscode-plug-clean:
	plugin=$(cat ./bundle/Vsplug | fzf)
	code --uninstall-extension ${plugin}

vscode-plug-list:
	code --list-extensions > ./bundle/Vsplug

## ----------------------------------------
##	Rust
##	- currently almost plugins are installed by brew.
## ----------------------------------------
rust-update:
	rustup update
	cargo install-update all

## ----------------------------------------
##	Npm
## ----------------------------------------
npm-install:
	npm install -g $(cat ./bundle/Npmfile)

npm-update:
	npm update -g npm
	npm update -g

## ----------------------------------------
##	Pip
## ----------------------------------------
pip-install:
	pip3 install -r ./bundle/Pipfile

pip-update:
	pip install --upgrade pip
	pip freeze | cut -d'=' -f1 | xargs -n1 pip install --upgrade
