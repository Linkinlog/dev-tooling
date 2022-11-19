:set clipboard=unnamed
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set mouse=a
:set cpo-=<


let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'

command Wt write | GoTest
command Wl write | GoLint


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

" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <C-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <C->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <C-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <C-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <C-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <C-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <C-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <C-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <C-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <C-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <C-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <C-0> <Cmd>BufferLast<CR>
" Close buffer
nnoremap <silent>    <C-A-w> <Cmd>BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButVisible
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

nnoremap <silent> <C-e> <Cmd>NvimTreeOpen<CR>
nnoremap <silent> <C-A-e> <Cmd>NvimTreeClose<CR>
nnoremap <silent> <C-p> <Cmd>Files<Cr>
nnoremap <silent> <C-f> <Cmd>Rg<Cr>

" Go Setup
source ~/.config/nvim/coc.vim

" Launch gopls when Go files are in use
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }

let g:ale_linters = {
  \ 'go': ['gopls'],
  \}

augroup LspGo
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'go-lang',
      \ 'cmd': {server_info->['gopls']},
      \ 'whitelist': ['go'],
      \ })
  " autocmd FileType go setlocal omnifunc=lsp#complete
  "autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
  "autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
  "autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
augroup END

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')



call plug#begin()

" Discord presence
Plug 'andweeb/presence.nvim'
" Debugging
Plug 'https://github.com/vim-vdebug/vdebug'
" Theming
Plug 'https://github.com/asvetliakov/vim-easymotion'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'romgrk/barbar.nvim'
" Center text
Plug 'junegunn/goyo.vim'
" Fuzzy find files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
" Dev Dock integration
Plug 'romainl/vim-devdocs'
" Nvim-tree
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
" Plug 'natebosch/vim-lsc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
PlugInstall | quit

lua require('nvimtree')
