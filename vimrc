colorscheme evening
command! Firefox :silent !firefox % &
command! -nargs=1 -complete=file Rename :call Rename(<f-args>)
syntax on
au BufNewFile,BufRead *vimrc* setf vim	" If filename matches 'vimrc' treat it as FileType vim (for autocommands)
""""	General Settings
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
	set statusline+=\ %y " show recognized filetype
	set ignorecase
	set smartcase
""""	Highlights 
	highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white
	highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=white
	highlight TabLine cterm=NONE ctermbg=blue ctermfg=white
	highlight TabLineFill cterm=NONE ctermbg=blue
""""	Key mappings
"	General mappings
	noremap <C-k> <C-y>k
	noremap <C-j> <C-e>j
	noremap <C-n> :tabnew<CR>
	noremap <C-l> <C-Right>
"	Normal mappings
	nnoremap <Up> ddkP
	nnoremap <Down> ddp
	nnoremap <Left> <<
	nnoremap <Right> >>
	nnoremap j <C-PageDown>
	nnoremap k <C-PageUp>
	nnoremap . :
	nnoremap ww<CR> <Esc>:w<CR>
	nnoremap <C-o> <C-w>gf
	nnoremap <F2> :Rename 
	nnoremap <F5> ggg?G``	" boss key (rot13)
	nnoremap <C-d> <Esc>ddko
	nnoremap <C-a> ggVG
	nnoremap H ^
	nnoremap L $
	nnoremap <C-t> :Texplore<CR>
	nnoremap <C-Up> <C-y>k
	nnoremap <C-Down> <C-e>j
	nnoremap <C-h> <C-Left>
	nnoremap <Space> za
""""	Visual mappings
	vnoremap <Tab> >gv
	vnoremap <S-Tab> <gv
	vnoremap <CR> Y
""""	Insert mappings
	inoremap jk <Esc>l
	inoremap <C-h> <C-o>h
	inoremap <C-j> <C-o>j
	inoremap <C-k> <C-o>k
	inoremap <C-l> <C-o>l
	inoremap if( if() {<CR>}<Esc>kllli
	inoremap ( ();<Esc>hi
"	FileType specific mappings
	autocmd FileType python,php,css,sh noremap <buffer> ; :s/^#//<CR>
	autocmd FileType python,php,css,sh noremap <buffer> , :s/^/#/<CR>
	autocmd FileType python nnoremap <buffer> <F9> :!python %<CR>
	autocmd FileType python nnoremap <buffer> [20;2~ :!python -i %<CR>
	autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,dry,except,finally,def,class
	autocmd FileType c nnoremap <buffer> , :s/^/\/\//<CR>
	autocmd FileType c nnoremap <buffer> ; :s/^\/\///<CR>
	autocmd FileType c nnoremap <buffer> <F9> :make<CR>
	autocmd FileType c nnoremap <buffer> <S-F9> :make<CR> :!./%<<CR>
	autocmd FileType c nnoremap <buffer> <C-F9> :make<CR> :!./%< 
	autocmd FileType vim nnoremap <buffer> <F9> :source %<CR>
	autocmd FileType vim nnoremap <buffer> , :s/^/"/<CR>
	autocmd FileType vim nnoremap <buffer> ; :s/^"//<CR>
	autocmd FileType sh nnoremap <buffer> <F9> :!bash %<CR>
	autocmd FileType php nnoremap <buffer> <F9> :!php %<CR>
" Keep folds when opening / closing a buffer
	autocmd BufWinLeave *.c,*.py,*.php,*.sh mkview
	autocmd BufWinEnter *.c,*.py,*.php,*.sh silent loadview

