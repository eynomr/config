#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

backup() {
	if [ -f "$1" ]; then
		echo "backing up $1 to $1.bak"
		mv "$1" "$1.bak"
	fi
}

backup ~/.zshrc
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc

backup ~/.zsh_aliases
ln -sf "$DOTFILES_DIR/.zsh_aliases" ~/.zsh_aliases

backup ~/.vimrc
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc

