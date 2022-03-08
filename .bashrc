#
# ~/.bashrc
#
# Bash executes this file on interactive non-login shell
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles
for file in ~/.{aliases,bash_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Add tab completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
