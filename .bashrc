#
# ~/.bashrc
#
# Bash executes this file on interactive non-login shell
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Load the shell dotfiles
for file in ~/.{aliases,bash_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Add tab completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Shortcut for markdown preview
md() {
	pandoc -f markdown -t html \
		-o /tmp/md-preview.html "$1" && firefox /tmp/md-preview.html
} 

# Use gpg-agent like SSH agent (https://wiki.archlinux.org/title/GnuPG#SSH_agent)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Configure pinentry to use the correct TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
