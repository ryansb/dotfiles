#
# Executes commands at login post-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

zstyle -t ':prezto:module:zcompile' enabled
case $? in
0|2)
	# Execute code that does not affect the current session in the background.
	{
		autoload -U zrecompile
		local ZDOTDIR="${ZDOTDIR:-$HOME}"
		zrecompile -q -p \
			-M "$ZDOTDIR"/.zcompdump -- \
			-R "$ZDOTDIR"/.zshrc -- \
			-R "$ZDOTDIR"/.zpreztorc -- \
			-R "$ZDOTDIR"/.zshenv

		# Set environment variables for launchd processes.
		if [[ "$OSTYPE" == darwin* ]]; then
			for env_var in PATH MANPATH; do
				launchctl setenv "$env_var" "${(P)env_var}"
			done
		fi
	} &!
esac

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  fortune -a
  print
fi

