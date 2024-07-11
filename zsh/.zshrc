BACK='#000000'
LD=''
L10=' %n '
L01=' %1~ '
LF10='#111111'
LB10='#eeee44'
LF01='#111111'
LB01='#44ee44'
LEFT0="%K{$LB10}%F{$LF10}$L10%b%f%k"
LEFT1="%K{$LB01}%F{$LB10}$LD%f%k"
LEFT2="%K{$LB01}%F{$LF01}$L01%f%k"
LEFT3="%K{$BACK}%F{$LB01}$LD%f%k"
RD=''
R10=' %D{%y.%m.%d(%a)} '
R01=' %D{%I:%M %p} '
RF10='#111111'
RB10='#44ee44'
RF01='#111111'
RB01='#eeee44'
RIGHT3="%K{$BACK}%F{$RB10}$RD%f%k"
RIGHT2="%K{$RB10}%F{$RF10}$R10%f%k"
RIGHT1="%K{$RB10}%F{$RB01}$RD%f%k"
RIGHT0="%K{$RB01}%F{$RF01}$R01%f%k"
PROMPT="$LEFT0$LEFT1$LEFT2$LEFT3 "
RPROMPT="$RIGHT3$RIGHT2$RIGHT1$RIGHT0"

source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^X^T' _

export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:~/.local/bin"
export PATH="$PATH:~/.cargo/bin"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias open='nautilus'
alias l='ls -alF'
alias vi='nvim'

# export USER="tkong"
# export MAIL="$USER@student.42seoul.kr"
# alias ccw='cc --std=c98 -Wall -Wextra -Werror -g2'
# alias c++w='c++ --std=c++98 -Wall -Wextra -Werror -g2'
