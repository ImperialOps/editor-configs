# aliases
alias k=kubectl
alias tf=terraform
alias tm=terramate
alias tff="terraform fmt -recursive"
alias ob=~/.scripts/open_browser.sh

# auto complete
. <(kubectl completion bash)
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
