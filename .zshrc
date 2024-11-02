
source ~/.zsh_aliases

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="clean"

export EDITOR='vim'

plugins=(
	git
	zsh-autosuggestions
	tmux
	zsh-syntax-highlighting
	ssh-agent
	z
)

source $ZSH/oh-my-zsh.sh

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

. "$HOME/.cargo/env"
