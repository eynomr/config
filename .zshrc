
source ~/.zsh_aliases

# Colors
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%F{blue}[%b]%f'
zstyle ':vcs_info:*' enable git
PROMPT='%F{green}%n%f:%F{white}%~%f ${vcs_info_msg_0_} $ '

export ZSH="$HOME/.oh-my-zsh"

export EDITOR='vim'

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	ssh-agent
	z
)

source $ZSH/oh-my-zsh.sh

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOs"
export PATH="$HOME/.local/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#. "$HOME/.local/bin/env"
#export PATH="$PATH:/Users/eyn/development/flutter/bin"
#export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
#export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
eval "$(uv generate-shell-completion zsh)"

# pnpm
export PNPM_HOME="/Users/eyn/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/bin:$PATH"

# bun completions
[ -s "/Users/eyn/.bun/_bun" ] && source "/Users/eyn/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
