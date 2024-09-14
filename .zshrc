# -------------------
# my zshrc configs
# -------------------
export CLICOLOR=1

alias v='nvim'
alias ll='ls -Ghal'

alias clai='~/Develop/clai/target/debug/clai'

alias tmuxc='nvim ~/.my_tmux'
alias shc='nvim ~/.my_sh'
alias nvimc='nvim ~/.my_nvim'

alias ollamaStart='systemctl start ollama.service'
alias ollamaStop='systemctl stop ollama.service'

PROMPT="%K{67}%F{234} %N %f%k%K{237} %~ %k "
RPROMPT="%t"
