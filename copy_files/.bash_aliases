### Git ###
# For single commands consider using .gitconfig instead
alias qmit='git add . && git commit -m "Committed via qmit alias" && git push'



### General sysadmin stuff ###

# This one requires root or a role that can add/remove snaps
alias remove_old_snaps='sudo snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then sudo snap remove "$snapname" --revision="$rev"; fi; done'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias dud='du -d 1 -h'
alias tree='tree -a -h -L 3 -I ".git"'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Faster faster faster
alias m=micro

# Better find
alias fd=fdfind

# Copy to cliboard for all outputs
alias cs="xclip -selection clipboard"

alias oplog='export OP_SESSION_my=$(op signin my --raw)'


### DevOpsLand ###

alias k=kubectl
alias drun="docker run --rm -it"
alias dockerhere="docker run --rm -it --entrypoint bash -v $PWD:/app --workdir /app"
alias tin="terraform init"
# Can be combined with -target etc
alias tpl="terraform plan -out terraform.tfplan"
alias tap="terraform apply 'terraform.tfplan'"
alias tcl="terraform fmt -recursive . && terraform-docs ."
