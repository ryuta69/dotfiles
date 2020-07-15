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
export ENHANCD_FILTER=fzf
export TERM=xterm-256color
export SLACK_DEVELOPER_MENU=true
export HOMEBREW_NO_AUTO_UPDATE=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

## ----------------------------------------
##	Editor
## ----------------------------------------
export EDITOR=nvim
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

## ----------------------------------------
##	Language
## ----------------------------------------
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

## ----------------------------------------
##	Autoload
## ----------------------------------------
autoload -Uz colors && colors
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

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
##	Completion
## ----------------------------------------
setopt share_history
export HISTSIZE=100
export SAVEHIST=10000
export HISTFILE=${HOME}/.zsh_history
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i && compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

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
##	- ~/.aliases/**.zsh has more aliases which not often used.
## ----------------------------------------
alias vi='nvim'
alias cdh='cd ~'
alias op='open ./'
alias cdwk='cd ~/work'
alias hf='hyperfine --max-runs 3'
alias virc='vi ~/.zshrc' sorc='source ~/.zshrc'
alias bat='bat --color=always --style=header,grid'
alias dus='dust -pr -d 2 -X ".git" -X "node_modules"'
alias python='/usr/local/bin/python3.8' pip='/usr/local/bin/pip3'
alias psa='ps aux' pskl='psa | fzf | awk "{ print \$2 }" | xargs kill -9'
alias fd='fd -iH --no-ignore-vcs -E ".git|node_modules"' rmds='fd .DS_Store -X rm'
alias rg='rg --hidden -g "!.git" -g "!node_modules" --max-columns 200' rgi='rg -i'
alias ll='exa -alhF --git-ignore --group-directories-first --time-style=long-iso --ignore-glob=".git|node_modules"' tr2='ll -T -L=2' tr3='ll -T -L=3'
mkcd() { mkdir "$1"; cd "$1"; }
fdr()  { fd "$1" | xargs sd "$2" "$3"; }
rgr()  { rg --files-with-matches "$1" | xargs sd "$1" "$2"; }
cmpr() { ffmpeg -i "$1" -vcodec h264 -acodec mp2 output.mp4; }
absp() { echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"); }
vv()   {
	[ -z "$1" ] && code -r ./ && return 0;
	code -r "$1";
}
lnsv() {
	[ -z "$2" ] && echo "Specify Target" && return 0;
	abspath=$(absp $1);
	ln -sfnv ${abspath} $2;
}
rgf()  {
	[ -z "$2" ] && matches=`rgi "$1"` || matches=`rg --files | rgi "$1"`;
	[ -z "${matches}" ] && echo "no matches\n" && return 0;
	selected=`echo "${matches}" | fzf --preview 'rgi -n "$1" {}'`;
	[ -z "${selected}" ] && echo "canceled\n" && return 0;
	vi ${selected};
}

## ========== Global Alias ==========
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g X='| xargs'
alias -g C='| wc -l'
alias -g L='| less S'
alias -g CP='| pbcopy'
alias -g AT='| as-tree'
alias -g TA='> ~/work/temp/a.log'
alias -g TB='> ~/work/temp/b.log'
alias dflg='delta ~/work/temp/a.log ~/work/temp/b.log'

## ========== Suffix Alias ==========
alias -s {png,jpg,jpeg}='imgcat'
alias -s {html,mp3,mp4,mov}='open'
alias -s {applescript}='osascript'

## ========== Git ==========
## - ~/.gitconfig has most of git aliases.
alias g='git' && compdef _git g
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

## ========== Tmux ==========
alias tm='tmux' && compdef _tmux tm
alias tmls='tmux list-sessions'
alias tmkla='tmux kill-session'
alias tmrn='tmux rename-session'
alias tmkl='tmux kill-session -t'
tmsw() {
	selected=`tmux list-sessions | fzf | cut -d : -f 1`
	[ -z "${selected}" ] && echo "canceled" && exit 0;
	if [ -z "${TMUX}" ]; then
		tmux a -t "${selected}"
	else
		tmux switch -t "${selected}"
	fi
}

## ========== Neovim ==========
alias vivi='vi ~/.config/nvim/init.vim'
vii() {
	FORMAT=`nkf -g $@`;
	vi -c ":e ++enc=${FORMAT}" $@;
}
vigo() {
	vi -c "call append(0, v:oldfiles)" -c "write! ~/.config/nvim/viminfo.log" -c exit;
	vi `bat ~/.config/nvim/viminfo.log | fzf --preview 'bat {}'`;
}

## ========== Aliases && Snippets ==========
[ -f ~/.secret_alias ] && source ~/.secret_alias
alias visn='vi `ls -d ~/.vsnip/*       | fzf --preview "bat {}"`'
alias vial='vi `ls -d ~/.aliases/*     | fzf --preview "bat {}"`'
alias soal='source `ls -d ~/.aliases/* | fzf --preview "bat {}"`'

## ----------------------------------------
##	FZF
## ----------------------------------------
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='--reverse --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## ----------------------------------------
##	iTerm2
## ----------------------------------------
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh
alias imgcat='/usr/local/bin/imgcat'

## ----------------------------------------
##	Gcloud
## ----------------------------------------
[ -f '${HOME}/google-cloud-sdk/path.zsh.inc' ] && source '${HOME}/google-cloud-sdk/path.zsh.inc'
[ -f '${HOME}/google-cloud-sdk/completion.zsh.inc' ] && source '${HOME}/google-cloud-sdk/completion.zsh.inc'

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
