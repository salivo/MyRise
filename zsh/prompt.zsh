autoload -Uz vcs_info

# Enable Git status
precmd() { vcs_info }

# Git status format
zstyle ':vcs_info:git:*' formats '%F{178}%K{178}%F{0}%b% %a  '
zstyle ':vcs_info:*' enable git

setopt PROMPT_SUBST
PROMPT=' %F{39} %F{178}%5~ %f%k%# '
RPROMPT='${vcs_info_msg_0_}'
