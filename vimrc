colorscheme evening
command! Firefox :silent !firefox % &
command! -nargs=1 -complete=file Rename :call Rename(<f-args>)
syntax on
""" General Settings
	set ts=4
	set shiftwidth=4
	set incsearch
	set hlsearch
	set autochdir
	set wildmenu
	set smartindent
	set number
	set cmdheight=2
	set modeline
	set laststatus=2
	set statusline=%F
	set ignorecase
	set smartcase
""" Highlights 
	highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white
	highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=white
	highlight TabLine cterm=NONE ctermbg=blue ctermfg=white
	highlight TabLineFill cterm=NONE ctermbg=blue
""" General mappings
	noremap <C-t> :Texplore<CR>
	noremap <C-Up> <C-y>k
	noremap <C-Down> <C-e>j
	noremap <C-n> :tabnew<CR>
	noremap <C-o> <C-w>gf
	noremap <F2> :Rename 
	noremap <F5> ggg?G``
	noremap <C-d> <Esc>ddko
	vnoremap <Tab> >gv
	vnoremap <S-Tab> <gv
	vnoremap <CR> Y
""" Keep folds when opening / closing a buffer
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
	map <C-k> <C-y>k
	map <C-j> <C-e>j
	map <C-l> <C-Right>
	map <C-h> <C-Left>
""" http://stackoverflow.com/questions/6778961 \
""" Insert mappings with <CTRL-V><ALT-(key)> !!
	nmap j <C-PageDown>
	nmap k <C-PageUp>
	imap j :w .+1<CR>
	imap k :w .-2<CR>
	map <Space> za
""" FileType specific mappings
	autocmd FileType python noremap <buffer> ; :s/^#//<CR>
	autocmd FileType python noremap <buffer> , :s/^/#/<CR>
	autocmd FileType python noremap <buffer> <F9> :!python %<CR>
	autocmd FileType c noremap <buffer> ; :s/^\/\///<CR>
	autocmd FileType c noremap <buffer> , :s/^/\/\//<CR>
	autocmd FileType vim noremap <buffer> <F9> :source %<CR>
