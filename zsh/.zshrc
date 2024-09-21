
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

#              
L=""
R=""
S=""
L1=" %n "
L2=" %1~"
LF10="#000000"
LB10="#babaee"
LF01="#000000"
LB01="#ccff99"
# LOPEN="%K{$LF10}%F{$LB10}$L%f%k"
L1="%K{$LB10}%F{$LF10}$L1%f%k"
LSEPAR="%K{$LB10}%F{$LB01}$S%f%k"
L2="%K{$LB01}%F{$LF01}$L2%f%k"
LCLOSE="%K{$LF01}%F{$LB01}$R%f%k"
PROMPT="$LOPEN$L1$LSEPAR$L2$LCLOSE "

R1="%D{%H:%M:%S} "
RF1="#000000"
RB1="#babaee"
ROPEN="%K{$RF1}%F{$RB1}$L%f%k"
RVALUE="%K{$RB1}%F{$RF1}$R1%f%k"
# RCLOSE="%K{$RF1}%F{$RB1}$R%f%k"
RPROMPT="$ROPEN$RVALUE$RCLOSE"

source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bindkey '^X^T' _

export PATH="$PATH:$HOME/../linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

alias ls='ls --color=auto'
alias l='ls -lhAF'
alias grep='grep --color=auto'
alias packup='apt update -y && apt upgrade -y && apt autoremove -y && brew update && brew upgrade && rustup update'
alias nvim-config='nvim ~/.config/nvim'

# End of lines added by compinstall
