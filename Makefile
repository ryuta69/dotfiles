help:
	@echo "\nᓚᘏᗢ < This is my personal dotfiles.\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-10s: %s\n", $$1, $$2}'

init: ## install dependencies.
	mkdir -p ~/.ssh
	mkdir -p ~/work
	mkdir -p ~/.config/nvim
	xcode-select --install
	ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install zsh
	sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
	sudo chsh -s /usr/local/bin/zsh
	chmod 755 /usr/local/share/zsh
	chmod 755 /usr/local/share/zsh/site-functions
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
	brew install zsh
	sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
	sudo chsh -s /usr/local/bin/zsh
	brew tap homebrew/bundle
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	./packages/install.zsh --force
	./dotfiles/install.zsh --force
	./vscode/install.zsh --force --test
	./macos/install.zsh --force --test
