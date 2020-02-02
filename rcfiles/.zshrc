## ----------------------------------------
##	Prompt
##	- Must be the top of .zshrc.
## ----------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## ----------------------------------------
##	ENV
## ----------------------------------------
export EDITOR=nvim
export ENHANCD_FILTER=fzf
export TERM=xterm-256color
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"
export HOMEBREW_NO_AUTO_UPDATE=1
export DOTPATH=~/.config/dotfiles
export FZF_DEFAULT_OPTS='
	--reverse
	--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
	--color info:150,prompt:110,spinner:150,pointer:167,marker:174'
alias virc='nvim ~/.zshrc'
alias sorc='source ~/.zshrc'

## ----------------------------------------
##	Autoload
## ----------------------------------------
autoload -Uz colors
colors
autoload -Uz compinit && compinit -i
compinit

## ----------------------------------------
##	Setopt
## ----------------------------------------
setopt no_beep
setopt globdots
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt list_packed

## ----------------------------------------
##	Alias
## ----------------------------------------
# Default Command
alias tm='tmux'
alias cde='cd -'
alias cdh='cd ~'
alias cdwk='cd ~/work'
function mkcd() { mkdir $@; cd $@; }
alias op='open ./'
alias dus='du -sh'
alias psa='ps aux'
alias pbcp='pbcopy <'
alias tree='tree -alL'
alias tarzip='tar czvf'
alias tarcat='tar tzvf'
alias tarunzip='tar xzvf'
alias jq='jq -rC'
alias -g jql='| jq length'
alias ll='ls -avlGF'
alias llv='nvim `ls | fzf --preview "cat {}"`'
function awkn() { awk "{print \$${1:-1}}"; }
function sshp() {
	grep "HOST" ~/.ssh/config;
	read -p "type hostname : " host;
	ssh ${host};
}

# Neovim
alias vi='nvim'
alias vivi='nvim ~/.config/nvim/init.vim'
function vii() {
	FORMAT=`nkf -g $@`;
	FORMAT=(${FORMAT}// /);
	nvim -c ":e ++enc=${FORMAT}" $@;
}
function vigo() {
	nvim -c "call append(0, v:oldfiles)" -c "write! ~/.config/nvim/viminfo.log" -c exit;
	nvim `cat ~/.config/nvim/viminfo.log | fzf --preview 'cat {}'`;
}

# Ripgrep
function rrg() {
	keyword=$1;
	[ -z $2 ] && matches=`rg -il ${keyword}` || matches=`rg --files | rg -i ${keyword}`;
	if [ -z ${matches} ];then echo "no matches\n" && return 0;fi;
	selected=`echo ${matches} | fzf --preview "pt ${keyword} {}"`;
	if [ -z ${selected} ];then echo "canceled\n" && return 0;fi;
	nvim ${selected};
}

# sed
alias sed='gsed'
function sedtop() {
	read -p "type string put into top : " string;
	sed '1i${string}' $@;
}
function sedend() {
	read -p "type string put into end : " string;
	sed '$a${string}' $@;
}

# Git
alias g='git'
compdef _git g
function gcre() {
	git init;
	read -p "type repo name        : " name;
	read -p "type repo description : " description;
	hub create ${name} -p ${description}
    	git add -A && git commit;
	git push --set-upstream origin master;
	hub browse;
}
alias ghg='ghq get'
alias ghcd='cd `ghq list -p | fzf`'
alias ghrm='rm -rf `ghq list -p | fzf`'
alias ghop='hub browse `ghq list | fzf | cut -d "/" -f 2,3`'

# Aliases
alias vial='vi `ls ${DOTPATH}/aliases/ | fzf --preview "cat ${DOTPATH}/aliases/{}"`'
alias srcal='source `ls ${DOTPATH}/aliases/ | fzf --preview "cat ${DOTPATH}/aliases/{}"`'

# Package Manager
alias brup='brew upgrade'
alias npup='npm update -g npm && npm update -g'
alias piup='pip install --upgrade pip && pip-review --auto'
alias paclist='brew list --versions > ${DOTPATH}/package_list/brewlist && \
	npm list -g --depth 0 > ${DOTPATH}/package_list/npmlist && \
	pip list > ${DOTPATH}/package_list/piplist'

# VSCode
alias vslist='cp -r ~/Library/Application\ Support/Code/User/snippets ${DOTPATH}/vscode/ &&
	cp ~/Library/Application\ Support/Code/User/settings.json ${DOTPATH}/vscode/ &&
	code --list-extensions | xargs -L 1 echo code --install-extension > ${DOTPATH}/vscode/plugins.txt &&
	cp ~/Library/Application\ Support/Code/User/keybindings.json ${DOTPATH}/vscode/ '

## ----------------------------------------
##	Keymap
## ----------------------------------------
bindkey '^F' forward-word
bindkey '^B' backward-word
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

## ----------------------------------------
##	Completion
## ----------------------------------------
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*:*:git:*' script ~/.zsh/completion/git-completion.bash
fpath=(~/.zsh/completion $fpath)
source ~/.zsh/completion/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/completion/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/completion/enhancd/init.sh

## ----------------------------------------
##	iTerm2
## ----------------------------------------
test -e "~/.iterm2_shell_integration.zsh" && source "~/.iterm2_shell_integration.zsh"

## ----------------------------------------
##	Prompt
##	- Must be the end of .zshrc.
##	- `p10k configure` to restart setting.
## ----------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.zsh/powerlevel10k/.p10k.zsh ]] || source ~/.zsh/powerlevel10k/.p10k.zsh
