## ----------------------------------------
##	Package Manager
## ----------------------------------------
alias brup='brew upgrade && brew cask upgrade'
alias npup='npm update -g npm && npm update -g'

## ----------------------------------------
##	ssh
## ----------------------------------------
function sshp() {
	HOST=grep "Host" ~/.ssh/config | fzf | awk "{ print \$2 }";
	ssh ${HOST};
}

## ----------------------------------------
##	Install Github Release
## ----------------------------------------
function dlgr() {
	URL=`curl -s "${@}" | grep "browser_download_url" | cut -d '"' -f 4 | fzf`
	curl -O ${URL}
}
