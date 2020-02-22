help:
	@echo "\nᓚᘏᗢ < This is my personal dotfiles. Any advice is appreciated!\n"
	@echo "1. You need Homebrew. Run commands below if you still haven't installed."
	@echo "xcode-select --install"
	@echo "/usr/bin/ruby -e \"\$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"\n"
	@echo "2. Make Commands"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-10s: %s\n", $$1, $$2}'

init: ## install dependencies.
	brew install zsh
	brew tap homebrew/bundle
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

packages: ## install package manager files.
	./packages/install.zsh

dotfiles: ## install dotfiles.
	./dotfiles/install.zsh

vscode: ## install VSCode settings.
	./vscode/install.zsh

macos: ## install MacOS settings.
	./macos/install.zsh

allrun: ## install all settings.
	@echo "Your file will be overwritten(Y/n)" && read ans && [ $${ans:-N} = Y ]
	./packages/install.zsh --force
	./dotfiles/install.zsh --force
	./vscode/install.zsh --force
	./macos/install.zsh --force

allrun_workflow:
	./packages/install.zsh --force
	./dotfiles/install.zsh --force
	./vscode/install.zsh --force --test
	./macos/install.zsh --force --test
