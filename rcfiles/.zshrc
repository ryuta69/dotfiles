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
export DOTPATH=~/.ghq/github.com/ryuta69/dotfiles
export FZF_DEFAULT_OPTS='
	--reverse
	--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
	--color info:150,prompt:110,spinner:150,pointer:167,marker:174'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
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
alias op='open ./'
alias dus='du -sh'
alias psa='ps aux'
alias ll='ls -avlGF'
alias lnsv='ln -sfnv'
alias pbcp='pbcopy <'
alias tzip='tar czvf'
alias tcat='tar tzvf'
alias cdwk='cd ~/work'
alias cdd='cd ${DOTPATH}'
alias tarunzip='tar xzvf'
alias lv='nvim `ls | fzf --preview "cat {}"`'
function mkcd() { mkdir $@; cd $@; }
function awkn() { awk "{print \$${1:-1}}"; }
function sshp() {
	grep "HOST" ~/.ssh/config;
	read host"?type hostname : ";
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
	selected=`echo ${matches} | fzf --preview "rg -in ${keyword} {}"`;
	if [ -z ${selected} ];then echo "canceled\n" && return 0;fi;
	nvim ${selected};
}

# sed
alias sed='gsed'
function sedtop() {
	read string"?type string put into top : ";
	sed '1i${string}' $@;
}
function sedend() {
	read string"?type string put into end : ";
	sed '$a${string}' $@;
}

# Git
alias g='git'
compdef _git g
function gcre() {
	git init;
    	git add -A && git commit;
	read name"?type repo name        : ";
	read description"?type repo description : ";
	hub create ${name} -p ${description};
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
