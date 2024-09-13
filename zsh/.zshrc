
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/tiny/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

BACK="#00000000"
LD=""
L10=" %n "
L01=" %1~ "
LF10="#ddff88"
LB10="#000001"
LF01="#000001"
LB01="#ddff88"
LEFT0="%K{$LB10}%F{$LF10}$L10%b%f%k"
LEFT1="%K{$LB01}%F{$LB10}$LD%f%k"
LEFT2="%K{$LB01}%F{$LF01}$L01%f%k"
LEFT3="%K{$BACK}%F{$LB01}$LD%f%k"
PROMPT="$LEFT0$LEFT1$LEFT2$LEFT3 "

RD=""
R10=" %D{%y.%m.%d(%a)} "
R01=" %D{%I:%M %p} "
RF10="#000001"
RB10="#000000"
RF01="#ddff88"
RB01="#000001"
# RIGHT3="%K{$BACK}%F{$RB10}$RD%f%k"
# RIGHT2="%K{$RB10}%F{$RF10}$R10%f%k"
RIGHT1="%K{$RB10}%F{$RB01}$RD%f%k"
RIGHT0="%K{$RB01}%F{$RF01}$R01%f%k"
RPROMPT="$RIGHT1$RIGHT0"

source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bindkey '^X^T' _

export PATH="$PATH:$HOME/../linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -lhAF'
alias packup='sudo echo "$(apt update -y && apt upgrade -y && apt autoremove -y)" && brew update && brew upgrade && rustup update'

# End of lines added by compinstall
