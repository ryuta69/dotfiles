export DOTPATH=~/.config/dotfiles
brew list --versions > ${DOTPATH}/package_list/brewlist && \
	npm list -g --depth 0 > ${DOTPATH}/package_list/npmlist && \
	pip list > ${DOTPATH}/package_list/piplist
