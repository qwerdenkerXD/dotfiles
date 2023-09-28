DISABLE_AUTO_TITLE="true"

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

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#export PATH="/usr/local/opt/openjdk/bin:$PATH"
