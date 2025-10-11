DISABLE_AUTO_TITLE="true"

# export PATH=$HOME/swift/usr/bin:"$PATH"
# export PATH=/home/franz/emsdk:/home/franz/emsdk/upstream/emscripten:"$PATH"
# EMSDK=/home/franz/emsdk
# EMSDK_NODE=/home/franz/emsdk/node/20.18.0_64bit/bin/node

# Some color changes
export LS_COLORS="${LS_COLORS}di=01;94:"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/franz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Oh My ZSH from here

plugins=(
    autojump
    colored-man-pages
    colorize  # ccat, cless
    command-not-found
    extract
    git
    gitfast
    nvm
    npm
    git-auto-fetch
    history
    ubuntu
)

plugins+=(zsh-syntax-highlighting)
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Import aliases from bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#export PATH="/usr/local/opt/openjdk/bin:$PATH"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

source ~/.pyenv/bin/activate
# source ~/intel/oneapi/setvars.sh > /dev/null
# export PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/2025/compilers/bin:"$PATH"

eval "$(starship init zsh)"
