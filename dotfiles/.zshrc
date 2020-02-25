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
export DOTPATH=~/.ghq/github.com/ryuta69/dotfiles/dotfiles
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH
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
# Base
alias tm='tmux'
alias sed='gsed'
alias cdh='cd ~'
alias op='open ./'
alias dus='du -sh'
alias psa='ps aux'
alias pbcp='pbcopy <'
alias cdwk='cd ~/work'
alias cdd='cd ${DOTPATH}'
function mkcd() { mkdir $@; cd $@; }
function sedr() { sed -i -- $@ **/*(D.); }
alias lv='nvim `ls | fzf --preview "cat {}"`'
alias pskl='ps aux | fzf | awk "{ print \$2 }" | xargs kill -9'
alias ll='exa -alhF --git-ignore --group-directories-first --time-style=long-iso'
alias tr2='exa -alhF --git-ignore --group-directories-first --time-style=long-iso -T -L=2 --ignore-glob=".git|node_modules"'
alias tr3='exa -alhF --git-ignore --group-directories-first --time-style=long-iso -T -L=3 --ignore-glob=".git|node_modules"'
function absp() { echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"); }
function lnsv() {
	abspath=$(echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"))
	ln -sfnv ${abspath} $2
}

# Git
alias g='git'
compdef _git g
alias ghg='ghq get'
alias opg='hub browse'
alias vig='vi ~/.gitconfig'
alias cdgh='cd `ghq list -p | fzf`'
alias rmgh='rm -rf `ghq list -p | fzf`'
alias opis='hub issue show `hub issue | fzf`'
alias cdg='cd `git rev-parse --show-toplevel`'
alias oppr='hub pr show `hub pr list | fzf`'
alias copr='hub pr checkout `hub pr list | fzf`'
alias opgh='hub browse `ghq list | fzf | cut -d "/" -f 2,3`'
function gcre() {
	git init;
    	git add -A && git commit;
	read name"?type repo name        : ";
	read description"?type repo description : ";
	hub create ${name} -p ${description};
	git push --set-upstream origin master;
	hub browse;
}

# Tar
function tz() { tar zcvf ${1}.tar.gz ${1}; }
function tunz() {
        case $1 in
                *.zip)     unzip $1    ;;
                *.tgz)     tar xvzf $1 ;;
                *.tbz2)    tar xvjf $1 ;;
                *.tar)     tar xvf $1  ;;
                *.tar.gz)  tar xvzf $1 ;;
                *.tar.bz2) tar xvjf $1 ;;
                *)         echo "Unable to extract '$1'" ;;
        esac
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
alias rg="rg --hidden -g '!.git' -g '!.node_modules'"
function rrg() {
	keyword=$1;
	[ -z $2 ] && matches=`rg -il ${keyword}` || matches=`rg --files | rg -i ${keyword}`;
	if [ -z ${matches} ];then echo "no matches\n" && return 0;fi;
	selected=`echo ${matches} | fzf --preview "rg -in ${keyword} {}"`;
	if [ -z ${selected} ];then echo "canceled\n" && return 0;fi;
	nvim ${selected};
}

# Aliases
alias vial='vi `ls -d ${DOTPATH}/aliases/* | fzf --preview "cat {}"`'
alias sral='source `ls -d ${DOTPATH}/aliases/* | fzf --preview "cat {}"`'

# Package Manager
alias brup='brew upgrade'
alias npup='npm update -g npm && npm update -g'

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
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh

## ----------------------------------------
##	Prompt
##	- Must be the end of .zshrc.
##	- `p10k configure` to restart setting.
## ----------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.zsh/powerlevel10k/.p10k.zsh ]] || source ~/.zsh/powerlevel10k/.p10k.zsh
