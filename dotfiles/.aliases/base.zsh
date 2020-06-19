## ----------------------------------------
##	Package Manager
## ----------------------------------------
alias zsup='zinit self-update && zinit update'
alias npup='npm update -g npm && npm update -g'
alias viup='vim +"PlugUpdate" +qa && nvim +"PlugUpdate" +qa'
alias brup='brew upgrade && brew update && brew cask upgrade'

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
