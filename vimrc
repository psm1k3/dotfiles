" Show whitespace (must be before colorscheme)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
set t_Co=256
colorscheme wombat256mod

command! Firefox :silent !firefox % &
command! -nargs=1 -complete=file Rename :call Rename(<f-args>)
syntax on
au BufNewFile,BufRead *vimrc* setf vim	" If filename matches 'vimrc' treat it as FileType vim (for autocommands)
""""	General Settings
	set ts=4	        " Tabsize 4 whitespaces
    set bs=2
	set softtabstop=4
	set shiftround
	set expandtab
	set history=700
	set undolevels=700
	set textwidth=79
	set nowrap
	set scrolloff=8
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
"-- Replaced by vim-powerline --
"	set statusline=%F	" show full filepath in statusline
"	set statusline+=\ %y " show recognized filetype
"----
	set ignorecase
	set smartcase
    set nobackup
    set nowritebackup
    set noswapfile
""""	Highlights
	highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white
	highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=white
	highlight TabLine cterm=NONE ctermbg=blue ctermfg=white
	highlight TabLineFill cterm=NONE ctermbg=blue
""""	Key mappings
"	    General mappings
	noremap <C-k> <C-y>k
	noremap <C-j> <C-e>j
	noremap <C-n> :tabnew<CR>
	noremap <C-l> <C-Right>
	noremap H ^
	noremap L $
"	    Normal mappings
	nnoremap <Up> ddkP
	nnoremap <Down> ddp
	nnoremap <Left> <<
	nnoremap <Right> >>
	nnoremap j <C-PageDown>
	nnoremap k <C-PageUp>
	nnoremap . :
	nnoremap ww<CR> <Esc>:w<CR>
	nnoremap wwq<CR> <Esc>:wq<CR>
	nnoremap <C-o> <C-w>gf
	nnoremap <F2> :Rename 
	nnoremap <F5> ggg?G``	" boss key (rot13)
	nnoremap <C-d> <Esc>ddko
	nnoremap <C-a> ggVG
	nnoremap <C-t> :Texplore<CR>
	nnoremap <C-Up> <C-y>k
	nnoremap <C-Down> <C-e>j
	nnoremap <C-h> <C-Left>
	nnoremap <Space> za
"   	Visual mappings
	vnoremap <Tab> >gv
	vnoremap <S-Tab> <gv
	vnoremap <CR> Y
"   	Insert mappings
	inoremap jk <Esc>l
	inoremap <C-h> <C-o>h
" 	inoremap <C-j> <C-o>j
" 	inoremap <C-k> <C-o>k
	inoremap <C-l> <C-o>l
	inoremap if( if() {<CR>}<Esc>kllli
"	    FileType specific mappings
	autocmd FileType python,php,css,sh noremap <buffer> ; :s/^# //<CR>
	autocmd FileType python,php,css,sh noremap <buffer> , :s/^/# /<CR>
	autocmd FileType python nnoremap <buffer> <F9> :!python %<CR>
	autocmd FileType python nnoremap <buffer> [20;2~ :!python -i %<CR>
	autocmd FileType php,c inoremap if( if() {<CR>}<Esc>kllli
	autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,dry,except,finally,def,class
	autocmd FileType c noremap <buffer> , :s/^/\/\//<CR>
	autocmd FileType c noremap <buffer> ; :s/^\/\///<CR>
	autocmd FileType c nnoremap <buffer> <F9> :make<CR>
	autocmd FileType c nnoremap <buffer> <S-F9> :make<CR> :!./%<<CR>
	autocmd FileType c nnoremap <buffer> <C-F9> :make<CR> :!./%<
	autocmd FileType vim nnoremap <buffer> <F9> :source %<CR>
	autocmd FileType vim vnoremap <buffer> , :s/^/" /<CR>
	autocmd FileType vim vnoremap <buffer> ; :s/^" //<CR>
	autocmd FileType vim nnoremap <buffer> , :s/^/" /<CR>
	autocmd FileType vim nnoremap <buffer> ; :s/^" //<CR>
	autocmd FileType sh nnoremap <buffer> <F9> :!bash %<CR>
	autocmd FileType php nnoremap <buffer> <F9> :!php %<CR>
" Keep folds when opening / closing a buffer
	autocmd BufWinLeave *.c,*.py,*.php,*.sh mkview
	autocmd BufWinEnter *.c,*.py,*.php,*.sh silent loadview
" Source .vimrc on saving
	autocmd! BufWritePost .vimrc source %

" pathogen
call pathogen#infect()

"" let mapleader = ","
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/

set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
