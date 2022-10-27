:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set cpo-=<



" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

function! OpenToRight()
  :normal v
  let g:path=expand('%:p')
  :q!
  execute 'belowright vnew' g:path
  :normal <C-l>
endfunction

function! OpenBelow()
  :normal v
  let g:path=expand('%:p')
  :q!
  execute 'belowright new' g:path
  :normal <C-l>
endfunction


function! NetrwMappings()
    " Hack fix to make ctrl-l work properly
    noremap <buffer> <C-l> <C-w>l
    noremap <silent> <C-f> :call ToggleNetrw()<CR>
    noremap <buffer> V :call OpenToRight()<cr>
    noremap <buffer> H :call OpenBelow()<cr>
endfunction

augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END

" Allow for netrw to be toggled
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Close Netrw if it's the only buffer open
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

" Make netrw act like a project Draw
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :call ToggleNetrw()
augroup END

let g:NetrwIsOpen=0

" Copy to system clipboard
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y

" Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"----------------------------------------------------------------------
" Key Mappings
"----------------------------------------------------------------------
" Remap a key sequence in insert mode to kick me out to normal
" mode. This makes it so this key sequence can never be typed
" again in insert mode, so it has to be unique.
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

call plug#begin()

Plug 'andweeb/presence.nvim'
Plug 'https://github.com/vim-vdebug/vdebug'
Plug 'https://github.com/asvetliakov/vim-easymotion'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
" Center text
Plug 'junegunn/goyo.vim'
" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fuzzy find files
Plug 'ctrlpvim/ctrlp.vim'
" This objectively makes vim better
Plug 'terryma/vim-multiple-cursors'
" Working with tags
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
" Commenting
Plug 'tpope/vim-commentary'
" Syntax highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Dev Dock integration
Plug 'romainl/vim-devdocs'

call plug#end()
