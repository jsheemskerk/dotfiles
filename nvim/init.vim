let mapleader = ","

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
hi Normal ctermbg=none
hi Terminal ctermbg=none
hi Terminal guibg=none
hi Normal guibg=none

autocmd BufNewFile,BufRead *.json.template set syntax=json

" }}}

" UI {{{

set number relativenumber
set modelines=1

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
nnoremap <leader>d dd
let g:airline_powerline_fonts = 1

nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==

"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}

" vim:foldmethod=marker:foldlevel=0
