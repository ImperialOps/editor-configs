# aliases
alias k=kubectl
alias tf=terraform
alias tm=terramate
alias tff="terraform fmt -recursive"
alias ob=~/.scripts/open_browser.sh
alias fkind="flux bootstrap github --owner=$GITHUB_USER --repository=gitops --branch=main --path=./clusters/kind --personal"
alias fdev="flux bootstrap github --owner=$GITHUB_USER --repository=gitops --branch=main --path=./clusters/dev --personal"

# auto complete
. <(kubectl completion bash)
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
