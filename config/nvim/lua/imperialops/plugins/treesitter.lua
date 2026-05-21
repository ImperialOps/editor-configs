require'nvim-treesitter'.install { 'go', 'ocaml', 'python', 'bash', 'terraform', 'hcl', 'markdown', 'json', 'yaml' }


vim.keymap.set('n', '<leader>pt', vim.cmd.UndotreeToggle)
