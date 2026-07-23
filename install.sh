#!/bin/bash

if [ -n "${BASH_SOURCE:-}" ]; then
	DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
elif [ -n "${ZSH_VERSION:-}" ]; then
	DOTFILES_DIR="$(cd "$(dirname "${(%):-%N}")" && pwd)"
else
	DOTFILES_DIR="$HOME/dotfiles"
fi

install_link() {
	name="$1"
	source_path="$DOTFILES_DIR/$name"
	target_path="$HOME/$name"

	if [ ! -e "$source_path" ]; then
		echo "Skipping missing $name"
		return
	fi

	if [ -L "$target_path" ] || [ -f "$target_path" ]; then
		rm -f "$target_path"
	elif [ -e "$target_path" ]; then
		echo "Skipping existing non-file $target_path"
		return
	fi

	ln -s "$source_path" "$target_path"
}

remove_link_if_owned() {
	name="$1"
	target_path="$HOME/$name"
	source_path="$DOTFILES_DIR/$name"

	if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
		rm -f "$target_path"
	fi
}

target_shell="${DOTFILES_SHELL:-${SHELL##*/}}"

echo "Installing shared dotfiles"
for i in .functions .aliases .exports .vim .vimrc .claude
do
	install_link "$i"
done

case "$target_shell" in
	zsh)
		echo "Installing zsh dotfiles"
		for i in .bashrc .bash_profile .bash_prompt
		do
			remove_link_if_owned "$i"
		done
		install_link .zshrc
		;;
	bash)
		echo "Installing bash dotfiles"
		remove_link_if_owned .zshrc
		for i in .bashrc .bash_profile .bash_prompt
		do
			install_link "$i"
		done
		;;
	*)
		echo "Unknown shell '$target_shell'; installed shared dotfiles only"
		echo "Set DOTFILES_SHELL=bash or DOTFILES_SHELL=zsh to choose explicitly"
		;;
esac

echo Installing config files
mkdir -p ~/.config
mkdir -p ~/.config/ghostty
ln -sf "$DOTFILES_DIR/ghostty-config" ~/.config/ghostty/config
