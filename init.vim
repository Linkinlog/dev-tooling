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
Plug 'https://github.com/asvetliakov/vim-easymotion'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

if exists('g:vscode')
	" THEME CHANGER
	function! SetCursorLineNrColorInsert(mode)
		" Insert mode: blue
		if a:mode == "i"
			call VSCodeNotify('nvim-theme.insert')

		" Replace mode: red
		elseif a:mode == "r"
			call VSCodeNotify('nvim-theme.replace')
		endif
	endfunction


	function! SetCursorLineNrColorVisual()
		set updatetime=0
		call VSCodeNotify('nvim-theme.visual')
	endfunction

	vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
	nnoremap <silent> <script> v v<SID>SetCursorLineNrColorVisual
	nnoremap <silent> <script> V V<SID>SetCursorLineNrColorVisual
	nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorLineNrColorVisual

	function! SetCursorLineNrColorVisual()
		set updatetime=0
		call VSCodeNotify('nvim-theme.visual')
	endfunction

	vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
	nnoremap <silent> <script> v v<SID>SetCursorLineNrColorVisual
	nnoremap <silent> <script> V V<SID>SetCursorLineNrColorVisual
	nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorLineNrColorVisual


	augroup CursorLineNrColorSwap
		autocmd!
		autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
		autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
		autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
	augroup END
else
    " ordinary neovim
endif
