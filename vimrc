colorscheme evening
command! Firefox :silent !firefox % &
command! -nargs=1 -complete=file Rename :call Rename(<f-args>)
syntax on
au BufNewFile,BufRead *vimrc* setf vim	" If filename matches 'vimrc' treat it as FileType vim (for autocommands)
" General Settings
	set ts=4	" Tabsize 4 whitespaces
	set shiftwidth=4	" shifting with < or > use 4 whitespaces
	set incsearch
"	set hlsearch
	set autochdir		" change dir when switching between tabs
	set wildmenu		" show possible hits, like autocompletion in menus
	set smartindent		" auto indent when coding with script blocks
	set number			" show line numbers
	set cmdheight=2
	set modeline
	set laststatus=2
	set statusline=%F	" show full filepath in statusline
	set ignorecase
	set smartcase
" Highlights 
	highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white
	highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=white
	highlight TabLine cterm=NONE ctermbg=blue ctermfg=white
	highlight TabLineFill cterm=NONE ctermbg=blue
"	General mappings
	nnoremap j <C-PageDown>
	nnoremap k <C-PageUp>
	noremap . :
	noremap ww<CR> <Esc>:w<CR>
"	noremap <C-o> <C-w>gf
	noremap <F2> :Rename 
	noremap <F5> ggg?G``	" boss key (rot13)
	noremap <C-d> <Esc>ddko
	noremap <C-a> ggVG
"	Normal mappings
	nnoremap H ^
	nnoremap L $
	nnoremap <C-t> :Texplore<CR>
	nnoremap <C-Up> <C-y>k
	nnoremap <C-Down> <C-e>j
	nnoremap <C-k> <C-y>k
	nnoremap <C-j> <C-e>j
	nnoremap <C-n> :tabnew<CR>
	nnoremap <C-l> <C-Right>
	nnoremap <C-h> <C-Left>
	nnoremap <Space> za
"	Visual mappings
	vnoremap <Tab> >gv
	vnoremap <S-Tab> <gv
	vnoremap <CR> Y
"	imap j :w .+1<CR>
"	imap k :w .-2<CR>
"	Insert mappings
	inoremap jk <Esc>l
" FileType specific mappings
	autocmd FileType python noremap <buffer> ; :s/^#//<CR>
	autocmd FileType python noremap <buffer> , :s/^/#/<CR>
	autocmd FileType python noremap <buffer> <F9> :!python %<CR>
	autocmd FileType python noremap <buffer> [20;2~ :!python -i %<CR>
	autocmd FileType c noremap <buffer> , :s/^/\/\//<CR>
	autocmd FileType c noremap <buffer> ; :s/^\/\///<CR>
	autocmd FileType vim noremap <buffer> <F9> :source %<CR>
	autocmd FileType vim noremap <buffer> , :s/^/"/<CR>
	autocmd FileType vim noremap <buffer> ; :s/^"//<CR>
" Keep folds when opening / closing a buffer
"	autocmd BufWinLeave *.* mkview
"	autocmd BufWinEnter *.* silent loadview
