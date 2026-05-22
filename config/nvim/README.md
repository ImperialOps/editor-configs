# Install on new machine 😃

sudo apt-get install build-essential

## NVIM LSP servers
 
brew install pnpm noevim ripgrap fd go opam tree-sitter-cli

| Language  | LSP Server  | Installation Command                              |
| --------- | ----------- | ------------------------------------------------- |
| Python    | pyright     | `pnpm add -g pyright@1.1.409`                     |
| Bash      | bashls      | `pnpm add -g bash-language-server@5.6.0`          |
| Go        | gopls       | `brew install gopls@0.22.0`                       |
| Terraform | terraformls | `brew install hashicorp/tap/terraform-ls@0.38.6`  |
| Lua       | lua_ls      | `brew install lua-language-server@3.18.2`         |
| OCaml     | ocamllsp    | `opam install ocaml-lsp-server`                   |

### Post-Installation Verification

After installing, restart Neovim or run :LspStart inside a relevant file. Check attachment status using:

```vim
:LspInfo
:checkhealth lazy
:checkhealth telescope
```
