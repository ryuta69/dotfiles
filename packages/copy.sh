export DOTPATH=~/.config/dotfiles
brew list --versions > ${DOTPATH}/packages/brewlist && \
	npm list -g --depth 0 > ${DOTPATH}/packages/npmlist && \
	pip list > ${DOTPATH}/packages/piplist
