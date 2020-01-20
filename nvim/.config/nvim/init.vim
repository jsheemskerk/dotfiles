let mapleader = ","

" basic {{{
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading vim-plug..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

set nocompatible
set encoding=utf-8
nnoremap c "_c
" }}}

" Plugins {{{
call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'cakebaker/scss-syntax.vim'
Plug 'caksoylar/vim-mysticaltutor'
Plug 'vim-airline/vim-airline'
call plug#end()
" }}}

" Section Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <space> za
" }}}

" Searching {{{

set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set showmatch
"   autocmd InsertEnter * :let @/=""
"}}}

" Tabs & Spaces {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
"set expandtab "tabs become spaces
" }}}

" Colors {{{

syntax enable
filetype plugin on
set termguicolors
colorscheme mysticaltutor
"colorscheme dracula

set bg=dark
set mouse=a
set guioptions=a

hi Normal ctermbg=none
hi Terminal ctermbg=none
hi Terminal guibg=none
hi Normal guibg=none

autocmd BufNewFile,BufRead *.json.template set syntax=json

" }}}

" UI {{{
set number relativenumber
set modelines=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set splitbelow splitright
" }}}}

" File find {{{
set path+=**
set wildmenu
set wildignore+=**/node_modules/** 
set hidden
" }}}

" vim ocnfig {{{
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

" General{{{
"default clipboard
set clipboard+=unnamedplus

"don't autocomment newlines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nnoremap S :%s//g<Left><Left>
nnoremap <leader>d dd
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==

set backspace=2
set ruler
nnoremap <leader>d dd

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" w!! = sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}

" vim:foldmethod=marker:foldlevel=0
