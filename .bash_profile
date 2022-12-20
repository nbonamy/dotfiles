
# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Auto-complete dir symlinks with trailing slash
#bind 'set mark-symlinked-directories on'

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# dircolors
if [ -e "$HOME/dotfiles/.lscolors" ]; then
  source "$HOME/dotfiles/.lscolors"
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# MacOS specific settings
if [[ "$SYSTEM" == "MacOS" ]]; then
  source $HOME/dotfiles/.bash_profile-macos
fi

# Local settings 
if [ -f $HOME/dotfiles/.bash_profile-local ]; then
  source $HOME/dotfiles/.bash_profile-local 2> /dev/null
fi

