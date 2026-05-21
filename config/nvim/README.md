# Install on new machine 😃

sudo apt-get install build-essential

## NVIM LSP servers
 
brew install noevim ripgrap fd node go opam tree-sitter-cli

| Language  | LSP Server  | Installation Command                              |
| --------- | ----------- | ------------------------------------------------- |
| Python    | pyright     | `npm install -g pyright`                          |
| Go        | gopls       | `go install golang.org/x/tools/gplsh@latest`      |
| Terraform | terraformls | `brew install hashicorp/tap/terraform-ls`         |
| Bash      | bashls      | `npm install -g bash-language-server`             |
| Lua       | lua_ls      | `brew install lua-language-server`                |
| OCaml     | ocamllsp    | `opam install ocaml-lsp-server`                   |

### Post-Installation Verification

After installing, restart Neovim or run :LspStart inside a relevant file. Check attachment status using:

```vim
:LspInfo
:checkhealth lazy
:checkhealth telescope
```
