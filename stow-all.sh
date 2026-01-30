#!/usr/bin/env bash

# Exit if any command fails
set -e

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/oh-my-posh"

echo "Stowing nvim to ~/.config/nvim..."
stow -v --dotfiles -t "$HOME/.config/nvim" nvim

echo "Stowing oh-my-posh to ~/.config..."
stow -v --dotfiles -t "$HOME/.config/oh-my-posh" oh-my-posh

echo "Stowing zsh to ~..."
stow -v --dotfiles -t "$HOME" zsh

echo "✓ All dotfiles stowed successfully"
