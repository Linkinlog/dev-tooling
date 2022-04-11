:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-vdebug/vdebug'
Plug 'https://github.com/vim-airline/vim-airline'

call plug#end()

if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif
