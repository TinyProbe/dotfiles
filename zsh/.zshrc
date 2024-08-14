# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tiny/.zshrc'

autoload -Uz compinit
compinit

BACK="#00000000"
LD=""
L10=" %n "
L01=" %1~ "
LF10="#ddff88"
LB10="#000000"
LF01="#000000"
LB01="#ddff88"
LEFT0="%K{$LB10}%F{$LF10}$L10%b%f%k"
LEFT1="%K{$LB01}%F{$LB10}$LD%f%k"
LEFT2="%K{$LB01}%F{$LF01}$L01%f%k"
LEFT3="%K{$BACK}%F{$LB01}$LD%f%k"
PROMPT="$LEFT0$LEFT1$LEFT2$LEFT3 "

# RD=""
# R10=" %D{%y.%m.%d(%a)} "
# R01=" %D{%I:%M %p} "
# RF10="#000000"
# RB10="#aaee66"
# RF01="#000000"
# RB01="#eecc55"
# RIGHT3="%K{$BACK}%F{$RB10}$RD%f%k"
# RIGHT2="%K{$RB10}%F{$RF10}$R10%f%k"
# RIGHT1="%K{$RB10}%F{$RB01}$RD%f%k"
# RIGHT0="%K{$RB01}%F{$RF01}$R01%f%k"
# RPROMPT="$RIGHT3$RIGHT2$RIGHT1$RIGHT0"
RD=""
R10=" %D{%y.%m.%d(%a)} "
R01=" %D{%I:%M %p} "
RF10="#000000"
RB10="#000000"
RF01="#ffff88"
RB01="#00000000"
RIGHT3="%K{$BACK}%F{$RB10}$RD%f%k"
RIGHT2="%K{$RB10}%F{$RF10}$R10%f%k"
RIGHT1="%K{$RB10}%F{$RB01}"
RIGHT0="%K{$RB01}%F{$RF01}$R01%f%k"
RPROMPT="$RIGHT1$RIGHT0"

source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bindkey '^X^T' _

export PATH="$PATH:$HOME/../linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -alF'
alias vi='nvim'

# End of lines added by compinstall
