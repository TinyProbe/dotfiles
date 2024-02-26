BACK='#000000'
LD=''
L10=' %n '
L01=' %1~ '
LF10='#222222'
LB10='#eeee44'
LF01='#222222'
LB01='#44ee44'
RD=''
R10=' %D{%Y-%m-%d(%a)} '
R01=' %D{%I:%M:%S%p} '
RF10='#222222'
RB10='#44ee44'
RF01='#222222'
RB01='#eeee44'
PROMPT="%K{$LB10}%F{$LF10}%B$L10%b%f%k%K{$LB01}%F{$LB10}$LD%f%k%K{$LB01}%F{$LF01}$L01%f%k%K{$BACK}%F{$LB01}$LD%f%k "
RPROMPT="%K{$BACK}%F{$RB10}$RD%f%k%K{$RB10}%F{$RF10}$R10%f%k%K{$RB10}%F{$RB01}$RD%f%k%K{$RB01}%F{$RF01}$R01%f%k"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^X^T' _

export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
alias l='ls -alF'
alias nv='nvim'

# export USER="tkong"
# export MAIL="$USER@student.42seoul.kr"
# alias ccw='cc --std=c98 -Wall -Wextra -Werror -g2'
# alias c++w='c++ --std=c++98 -Wall -Wextra -Werror -g2'
