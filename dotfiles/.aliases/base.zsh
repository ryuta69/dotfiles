## ----------------------------------------
##	Package Manager
## ----------------------------------------
alias zsup='zinit self-update && zinit update'
alias npup='npm update -g npm && npm update -g'
alias rsup='rustup update && cargo install-update --all'
alias viup='vim +"PlugUpdate" +qa && nvim +"PlugUpdate" +qa'
alias brup='brew upgrade && brew update && brew cask upgrade'
alias piup='pip install --upgrade pip && pip freeze | cut -d'=' -f1 | xargs -n1 pip install --upgrade'

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
