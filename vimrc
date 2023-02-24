set nohlsearch
set rnu
set incsearch
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=10
set guicursor=n:block
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let mapleader = " "

inoremap jj <ESC>

nnoremap <leader>s :w<CR>
nnoremap <leader>w :q<CR>
