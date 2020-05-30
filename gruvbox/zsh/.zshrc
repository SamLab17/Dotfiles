# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# The directory this script is being run from
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# The root of the dotfiles repo is 2 levels up from here
CONFIG_DIR="${SCRIPT_DIR}/../../"

# Aliases for scripts or copying template files
alias utssh="python3 ${CONFIG_DIR}/scripts/UnixHostFinder.py slaberge"
alias formatfile="cp ${CONFIG_DIR}/templates/clang-format .clang-format"

# NeoVim editor
alias vim=nvim


# Paths for Mac and Linux
case `uname` in
	Darwin)
		export PATH="${PATH}:${HOME}/Library/Python/3.6/bin:${HOME}/.local/bin"
	;;
	Linux)
		export PATH="${PATH}:${HOME}/.local/bin:/snap/bin"
	;;
esac

