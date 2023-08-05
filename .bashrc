# aliases
alias k=kubectl
alias tff="terraform fmt -recursive"

# auto complete
. <(kubectl completion bash)
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
