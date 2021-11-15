alias m=micro
alias k=kubectl

# Git (if single command consider using .gitconfig instead)
alias qmit='git add . && git commit -m "Committed via qmit alias" && git push'

# General sysadmin stuff
# This one requires root or a role that can add/remove snaps
alias remove_old_snaps='snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then snap remove "$snapname" --revision="$rev"; fi; done'

# DevOpsLand
alias drun="docker run --rm -it"
alias tin="terraform init"
# Can be combined with -target etc
alias tpl="terraform plan -out /tmp/terraform"
alias tap="terraform apply /tmp/terraform"

alias test_alias='echo "Aliases loaded successfully!"'
