# Install on new machine 😃

sudo apt-get install build-essential

## NVIM LSP servers
 
brew install pnpm uv noevim ripgrap fd go opam tree-sitter-cli

| Language  | LSP Server   | Installation Command                              |
| --------- | -----------  | ------------------------------------------------- |
| Python    | basedpyright | `uv tools add basedpyright`                       |
| Bash      | bashls       | `pnpm add -g bash-language-server`                |
| Go        | gopls        | `brew install gopls`                              |
| Terraform | terraformls  | `brew install hashicorp/tap/terraform-ls`         |
| Lua       | lua_ls       | `brew install lua-language-server`                |
| OCaml     | ocamllsp     | `opam install ocaml-lsp-server`                   |

### Post-Installation Verification

After installing, restart Neovim. Check attachment status using:

```vim
:checkhealth lazy
:checkhealth lsp
:checkhealth telescope
```
