alias m=micro
alias k=kubectl

# Git (if single command consider using .gitconfig instead)
alias qmit='git add . && git commit -m "Committed via qmit alias" && git push'

# General sysadmin stuff
# This one requires root or a role that can add/remove snaps
remove_old_snaps='snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then snap remove "$snapname" --revision="$rev"; fi; done'

alias test_alias='echo "Aliases loaded successfully!"'
