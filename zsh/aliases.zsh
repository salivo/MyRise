alias getidf='. $HOME/esp/esp-idf/export.sh'
alias zephyra='source /opt/zephyrproject/zephyr_env/bin/activate'
alias pictrl='$HOME/.config/scripts/pictrl.sh'
alias enva='. ./env/bin/activate'
alias rr='bash $HOME/.config/scripts/roll.sh'
alias btw='fastfetch'
alias suka='sudo'
alias pls='sudo'

command_not_found_handler() {
    rr
    return 127
}
