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
export SLACK_DEVELOPER_MENU=true
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
[ -f ~/.extension_settings.zsh ] && source ~/.extension_settings.zsh

## ----------------------------------------
##	Autoload
## ----------------------------------------
autoload -Uz colors && colors
autoload -Uz compinit && compinit -i && compinit
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

## ----------------------------------------
##	Language
## ----------------------------------------
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

## ----------------------------------------
##	Completion
## ----------------------------------------
setopt share_history
export HISTSIZE=100
export SAVEHIST=10000
export HISTFILE=${HOME}/.zsh_history
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
fpath=(~/.zsh/completion $fpath)

## ----------------------------------------
##	Setopt
## ----------------------------------------
setopt no_beep
setopt globdots
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt list_packed
setopt no_flow_control

## ----------------------------------------
##	Keymap
## ----------------------------------------
bindkey '^F' forward-word
bindkey '^B' backward-word
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

## ----------------------------------------
##	Alias
## ----------------------------------------
## ========== General ==========
alias sed='gsed'
alias cdh='cd ~'
alias op='open ./'
alias psa='ps aux'
alias pbcp='pbcopy <'
alias cdwk='cd ~/work'
alias virc='nvim ~/.zshrc'
alias sorc='source ~/.zshrc'
alias hf='hyperfine --min-runs 3'
alias rmds='fd .DS_Store -X rm'
alias dus='dust -pr -d 2 -X ".git" -X "node_modules"'
alias fd='fd -iH --no-ignore-vcs -E ".git|node_modules"'
alias pskl='ps aux | fzf | awk "{ print \$2 }" | xargs kill -9'
alias lv='nvim `ls | fzf --preview "bat --color=always --style=header,grid --line-range :100 {}"`'
alias ll='exa -alhF --git-ignore --group-directories-first --time-style=long-iso'
alias tr2='exa -alhF --git-ignore --group-directories-first --time-style=long-iso -T -L=2 --ignore-glob=".git|node_modules"'
alias tr3='exa -alhF --git-ignore --group-directories-first --time-style=long-iso -T -L=3 --ignore-glob=".git|node_modules"'
mkcd() { mkdir $@; cd $@; }
absp() { echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"); }
vscd() {
	[ -z $1 ] && code -r ./ && return 0;
	code -r "$2";
}
lnsv() {
	[ -z $2 ] && echo "Specify Target" && return 0;
	abspath=$(echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"))
	ln -sfnv ${abspath} $2
}

## ========== Global Alias ==========
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g X='| xargs'
alias -g C='| wc -l'
alias -g CP='| pbcopy'
alias -g AT='| as-tree'
alias -g TA='> ~/work/temp/a.log'
alias -g TB='> ~/work/temp/b.log'
alias dflg='diff ~/work/temp/a.log ~/work/temp/b.log'

## ========== Suffix Alias ==========
alias -s {png,jpg,jpeg}='imgcat'
alias -s {html,mp3,mp4,mov}='open'
alias -s {applescript}='osascript'

## ========== Git ==========
alias g='git'
compdef _git g
alias cdgh='cd `ghq list -p | fzf`'
alias cdg='cd `git rev-parse --show-toplevel`'
gcre() {
	[ -z "$(ls -A ./)" ] && echo "Fail: Empty" && return 0;
	git init;
	git add -A && git commit;
	read name"?type repo name        : ";
	read description"?type repo description : ";
	hub create ${name} -d ${description} -p;
	git push --set-upstream origin master;
	hub browse;
}

## ========== Tar ==========
tz() { tar zcvf ${1}.tar.gz ${1}; }
extract() {
	case $1 in
		*.tar.gz|*.tgz) tar xzvf $1;;
		*.tar.xz) tar Jxvf $1;;
		*.zip) unzip $1;;
		*.lzh) lha e $1;;
		*.tar.bz2|*.tbz) tar xjvf $1;;
		*.tar.Z) tar zxvf $1;;
		*.gz) gzip -d $1;;
		*.bz2) bzip2 -dc $1;;
		*.Z) uncompress $1;;
		*.tar) tar xvf $1;;
		*.arj) unarj $1;;
	esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

## ========== Tmux ==========
alias tm='tmux'
compdef _tmux tm
alias tmls='tmux list-sessions'
alias tmkla='tmux kill-session'
alias tmrn='tmux rename-session'
alias tmkl='tmux kill-session -t'
tmsw() {
	selected=`tmux list-sessions | fzf | cut -d : -f 1`
	[ -z ${selected} ] && echo "canceled" && exit 0;
	if [ -z "${TMUX}" ]; then
		tmux a -t ${selected}
	else
		tmux switch -t ${selected}
	fi
}

## ========== MySQL ==========
alias scn='mycli -u root'
alias sstart='mysql.server start'
alias sst='mysql.server status'
alias sstop='mysql.server stop'

## ========== Neovim ==========
alias vi='nvim'
alias vivi='nvim ~/.config/nvim/init.vim'
vii() {
	FORMAT=`nkf -g $@`;
	FORMAT=$(echo ${FORMAT});
	nvim -c ":e ++enc=${FORMAT}" $@;
}
vigo() {
	nvim -c "call append(0, v:oldfiles)" -c "write! ~/.config/nvim/viminfo.log" -c exit;
	nvim `bat ~/.config/nvim/viminfo.log | fzf --preview 'bat --color=always --style=header,grid --line-range :100 {}'`;
}

## ========== Ripgrep ==========
alias rg="rg --hidden -g '!.git' -g '!node_modules' --max-columns 200 -i"
rrg() {
	keyword=$1;
	[ -z $2 ] && matches=`rg -il ${keyword}` || matches=`rg --files | rg -i ${keyword}`;
	[ -z ${matches} ] && echo "no matches\n" && return 0;
	selected=`echo ${matches} | fzf --preview "rg -in ${keyword} {}"`;
	[ -z ${selected} ] && echo "canceled\n" && return 0;
	nvim ${selected};
}

## ========== Aliases && Snippets ==========
alias visn='nvim `ls -d ~/.vsnip/* | fzf --preview "bat --color=always --style=header,grid --line-range :100 {}"`'
alias vial='nvim `ls -d ~/.aliases/* | fzf --preview "bat --color=always --style=header,grid --line-range :100 {}"`'
alias soal='source `ls -d ~/.aliases/* | fzf --preview "bat --color=always --style=header,grid --line-range :100 {}"`'

## ----------------------------------------
##	FZF
## ----------------------------------------
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git' -g '!node_modules' --max-columns 200"
export FZF_DEFAULT_OPTS='--reverse --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## ----------------------------------------
##	Anyenv
## ----------------------------------------
# export PATH="$HOME/.anyenv/bin:$PATH"
# eval "$(anyenv init -)"

## ----------------------------------------
##	iTerm2
## ----------------------------------------
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh
unalias imgcat

## ----------------------------------------
##	Gcloud
## ----------------------------------------
if [ -f '/Users/kohei.murakami/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kohei.murakami/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/kohei.murakami/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kohei.murakami/google-cloud-sdk/completion.zsh.inc'; fi

## ----------------------------------------
##	Zinit
## ----------------------------------------
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
	print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
	command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
	command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
		print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
		print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light-mode for zinit-zsh/z-a-patch-dl zinit-zsh/z-a-as-monitor zinit-zsh/z-a-bin-gem-node
zinit light b4b4r07/enhancd
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

## ----------------------------------------
##	Prompt
##	- Must be the end of .zshrc.
##	- `p10k configure` to restart setting.
## ----------------------------------------
zinit ice depth=1; zinit light romkatv/powerlevel10k
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
### End of Zinit's installer chunk
