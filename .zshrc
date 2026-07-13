# Load shared shell config.
# ~/.extra can be used for settings you do not want to commit.
for file in ~/.{extra,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Match file names case-sensitively in globbing and completion.
setopt caseglob

# History behavior close to the old Bash defaults.
HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
HISTSIZE="${HISTSIZE:-4096}"
SAVEHIST="${SAVEHIST:-4096}"
setopt append_history
setopt hist_ignore_space
setopt hist_reduce_blanks

# Completion.
autoload -Uz compinit
compinit

# dircolors
if [ -e "$HOME/dotfiles/.lscolors" ]; then
  source "$HOME/dotfiles/.lscolors"
fi

# Show useful stuff in terminal title.
precmd() {
  print -Pn "\e]0;%n@%m: %~\a"
}

# Prompt equivalent of the old Bash prompt.
setopt prompt_subst
default_username1=
default_username2=
if [[ "$USER" != "$default_username1" && "$USER" != "$default_username2" ]]; then
  prompt_usernamehost="%B%F{9}%n%f%b at %B%F{172}%m%f%b in "
fi
PROMPT=$'\n'"${prompt_usernamehost}"'%B%F{190}%~%f%b
$ %f'
unset prompt_usernamehost default_username1 default_username2

if [ -f "$HOME/.zshrc-local" ]; then
  source "$HOME/.zshrc-local"
fi

# OpenAI shrc (if customising, comment out to prevent it getting readded)
for file in "/Users/nbonamy/.openai/shrc"/*; do
    source "$file"
done
export API_REPO_PATH="/Users/nbonamy/code/openai/api"
source ~/.api_shell_include
source /Users/nbonamy/code/openai/api/applied-devtools/completions/applied_completions.zsh
export PATH="/Users/nbonamy/bin:$PATH"
