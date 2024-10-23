# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# kubectl
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
function __kex {                                                                
         if [ -n "$1" ]; then  
            kubectl exec --stdin --tty "$1" -- /bin/bash
         fi                                                                     
} 
alias kex='__kex'
alias kns='kubens' # requires kubens
alias Y="-o yaml"
alias YL="-o yaml | less -R"
alias PL="| less -R"
alias YPL="-o yaml | yq ea -C | less"
alias YPNL="-o yaml | kubectl neat | yq ea -C | less"

# nvim
alias n="nvim"

# clipboard
alias xcopy='xclip -selection clipboard'
alias pbcopy='xclip -selection clipboard' # use xclip for everything
alias pbpaste='xclip -selection clipboard -o'

# git
alias gs='git status' # Overrides ghostscript, kinda messy
alias ga='git add -A'
alias gg='git commit -am' # Not very intuitive

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
