
source ~/.zsh_aliases

export PATH="$PATH:/opt/nvim-linux64/bin"
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

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
