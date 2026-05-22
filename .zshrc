# ALIASES
alias tff="tofu fmt -recursive"
alias uvv="source .venv/bin/activate"

# GO
export PATH=$PATH:$HOME/go/bin

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# local/bin
export PATH="$HOME/.local/bin:$PATH"
# end local/bin

