export DOTPATH=~/.ghq/github.com/ryuta69/dotfiles

cp ~/Library/Application\ Support/Code/User/settings.json ${DOTPATH}/vscode/ &&
	code --list-extensions > ${DOTPATH}/vscode/plugins.txt &&
	cp ~/Library/Application\ Support/Code/User/keybindings.json ${DOTPATH}/vscode/
