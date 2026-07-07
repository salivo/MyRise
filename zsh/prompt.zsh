autoload -Uz vcs_info
# Enable Git status
precmd() { vcs_info }

# Git status format (Your original)
zstyle ':vcs_info:git:*' formats '%F{178}%K{178}%F{0}%b% %a  '
zstyle ':vcs_info:*' enable git

# Simple Yellow Container Tag
get_dbx() {
  # If CONTAINER_ID is set, show [name] in yellow
  [ -n "$CONTAINER_ID" ] && echo "%F{yellow}($CONTAINER_ID)%f "
}

setopt PROMPT_SUBST
# PROMPT: [box] Arch Icon | Path | %#
PROMPT='$(get_dbx)%F{39} %F{178}%5~ %f%k%# '
RPROMPT='${vcs_info_msg_0_}'
