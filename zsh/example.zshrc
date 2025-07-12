# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andry/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

export PATH="$HOME/.local/bin:$PATH"

source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/autostart.zsh
source ~/.config/zsh/keybindings.zsh
source ~/.config/zsh/aliases.zsh
