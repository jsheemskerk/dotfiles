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
nnoremap C "_C"

"maybe useless
"set undodir=$VIM/undo
"set backupdir=$VIM/vimtmp
"set directory=$VIM/vimtmp
"set history=1000
"set undolevels=1000
" }}}

" Plugins {{{
call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'cakebaker/scss-syntax.vim'
Plug 'caksoylar/vim-mysticaltutor'
"Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-notes'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
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
set ignorecase
set smartcase
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
filetype plugin indent on
set termguicolors
colorscheme mysticaltutor
"colorscheme gruvbox
"colorscheme slate
"colorscheme nord
"colorscheme dracula
"let g:gruvbox_contrast_dark = 'hard'

"set bg=dark
set mouse=a
set guioptions=a

hi Normal ctermbg=none
hi Terminal ctermbg=none
hi Terminal guibg=none
hi Normal guibg=none

highlight Normal ctermbg=Black
highlight NonText ctermbg=Black

"colorscheme srcery
set guifont=Consolas:h12
" }}}

" UI {{{
set number relativenumber
set modelines=1
set cursorline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
set splitbelow splitright
" }}}}

" File find {{{
set path+=**
set wildmenu
set hidden
" }}}

" vim ocnfig {{{
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

"latex {{{
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_general_viewer = 'mupdf'
"set laststatus=2

"}}}

" nerdtree {{{
map <leader>n :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree

"}}}

" stuff like auto completion {{{

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

"}}}

" buffers {{{
nmap <leader>t :enew <CR>
nmap <leader>l :bnext<CR>
nmap <C-j> :bprevious<CR>
nmap <C-k> :bnext<CR>
nmap <leader>; :bprevious<CR>
nmap <leader>q :bd!<CR>
nmap <leader>bs :ls<CR>


nmap <Leader>w- <Plug>(golden_ratio_resize)
" Fill screen with current window.
nnoremap <Plug>(window-fill-screen) <C-w><Bar><C-w>_
nmap <Leader>w+ <Plug>(window-fill-screen)


"}}}

" General{{{
"default clipboard
set clipboard+=unnamedplus
vmap <leader>y !sel -i -b && xsel -b <CR>
nmap <leader>p :r !xsel -b <CR>

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
"map <C-j> <C-w>j
"map <C-k> <C-w>k
map <C-l> <C-w>l

" w!! = sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" }}}

set showcmd
" vim:foldmethod=marker:foldlevel=0
