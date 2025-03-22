
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

export PATH="$PATH:$HOME/../linuxbrew/.linuxbrew/bin" # brew apps
export PATH="$PATH:$HOME/.local/bin" # local applications
export PATH="$PATH:$HOME/.cargo/bin" # installed by cargo
export PATH="$PATH:$HOME/go/bin" # go Fyne library config
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH" # language server

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

# c++ search path
export CPLUS_INCLUDE_PATH="/usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11"

alias rg='rg --color=auto'
alias ls='ls --color=auto'
alias l='ls -lhAF'
alias packup='apt update -y && apt upgrade -y && apt autoremove -y && brew update && brew upgrade && rustup update stable'
alias nvim_config='nvim ~/.config/nvim'
alias clipbd='xclip -selection clipboard'
alias vm_android='flutter emulators --launch Medium_Phone_API_35'

# End of lines added by compinstall
