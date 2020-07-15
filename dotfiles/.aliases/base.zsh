## ----------------------------------------
##	Package Manager
## ----------------------------------------
alias zsup='zinit self-update && zinit update'
alias npup='npm update -g npm && npm update -g'
alias rsup='rustup update && cargo install-update --all'
alias viup='vim +"PlugUpdate" +qa && nvim +"PlugUpdate" +qa'
alias brup='brew update && brew upgrade && brew cask upgrade'
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
