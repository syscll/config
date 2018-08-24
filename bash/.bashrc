function prompt {
	local EXIT="$?"
	local RESET="\[\e[0m\]"
	local RED="\[\e[1;31m\]"
	local GREEN="\[\e[1;32m\]"

	PS1="${GREEN}[\u@\h] \W \\$ ${RESET}"
	if [ "${EXIT}" -ne 0 ]; then
		PS1="${RED}${EXIT}${RESET} ${PS1}"
	fi
}

PROMPT_COMMAND=prompt

shopt -s direxpand
shopt -s checkwinsize

set show-all-if-unmodified on

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export TERM="xterm-256color"
export EDITOR="nvim"
export DEVPATH="$HOME/dev"
export GOPATH="$DEVPATH/go"
export PATH="$HOME/.cargo/bin:$GOPATH/bin:$HOME/bin:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin"
export HISTTIMEFORMAT="%d/%m/%y %T  "

alias bashconf="$EDITOR $HOME/.bashrc"
alias nvimconf="$EDITOR $HOME/.config/nvim/init.vim"
alias rm=rm2
alias src="source $HOME/.bashrc"
alias vim=nvim
alias op=1p
alias t=tmux
alias ls="ls --color=auto"
alias grep="grep --color=always --exclude-dir=.git"

if [ -f $HOME/.bashrc.local ]; then
	source $HOME/.bashrc.local
fi
