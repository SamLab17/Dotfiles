# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sam/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export CONFIG_DIR="${HOME}/config"

alias utssh="python3 ${CONFIG_DIR}/UnixHostFinder.py slaberge"
alias vim=nvim

case `uname` in
	Darwin)
		# Commands for macOS
		export PATH="${PATH}:${HOME}/Library/Python/3.6/bin/:${HOME}/.local/bin"
	;;
	Linux)
		export PATH="${PATH}:${HOME}/.local/bin/"
	;;
esac

