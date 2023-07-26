let mapleader = " "

" basic {{{
if has('nvim')
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading vim-plug..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
endif

set nocompatible
set encoding=utf-8



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
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-notes'
"Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
"Plug 'airblade/vim-gitgutter'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'SirVer/ultisnips'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
" Plug 'CoderCookE/vim-chatgpt'
Plug 'madox2/vim-ai'
call plug#end()
" }}}

" Section Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
" }}}

" Searching {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <leader>, :nohlsearch<CR>
set showmatch
"   autocmd InsertEnter * :let @/=""
"}}}

" Tabs & Spaces {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab "tabs become spaces
" }}}

" Colors {{{

syntax enable
filetype plugin indent on
set termguicolors
" colorscheme mysticaltutor
colorscheme gruvbox
"colorscheme slate
"colorscheme nord
"colorscheme dracula
" let g:gruvbox_contrast_dark = 'hard'

"set bg=light
" set bg=dark
set mouse=a
set guioptions=a

" hi Normal ctermbg=none
" hi Terminal ctermbg=none
" hi Terminal guibg=none
" hi Normal guibg=none

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
set wildmode=longest,list,full
set wildmenu
set hidden
set wildignore+=**/.git/*
" }}}

" vim config {{{
nnoremap <leader>vv :vsp $MYVIMRC<CR>
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC <bar> :doautocmd BufRead<CR>
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

" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

"}}}

" buffers {{{
nmap <leader>t :enew <CR>
nmap <leader>l :bnext<CR>
nmap <M-p> :bprevious<CR>
nmap <M-n> :bnext<CR>
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

set backspace=2
set ruler

nnoremap S :%s//g<Left><Left>
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


nnoremap c "_c
nnoremap C "_C
nnoremap x "_x
nnoremap Y yg_
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <silent> Q <nop>

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u


map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
map <C-l> <C-w>l


xnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" w!! = sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" }}}


" Go {{{
"let g:go_debug_windows = {
"      \ 'vars':       'rightbelow 60vnew',
"      \ 'stack':      'rightbelow 10new',
"\ }
"
"set autowrite
"
"
"autocmd FileType go nmap <leader>b <Plug>(go-build)
"autocmd FileType go nmap <leader>r <Plug>(go-run)
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"}}}

" COC {{{
set updatetime=300
set signcolumn=yes

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> <leader>qf <Plug>(coc-codeaction-cursor)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>

nmap <leader>cr <Plug>(coc-rename)

xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

xmap <leader>ce  <Plug>(coc-format-selected)
nmap <leader>ce  <Plug>(coc-format-selected)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}

" AI {{{

nnoremap <leader>aa :AI<CR>
xnoremap <leader>aa :AI<CR>

" edit text with a custom prompt
" xnoremap <leader>as :AIEdit fix grammar and spelling<CR>
" nnoremap <leader>as :AIEdit fix grammar and spelling<CR>

" trigger chat
xnoremap <leader>as :AIChat<CR>
nnoremap <leader>as :AIChat<CR>

" redo last AI command
nnoremap <leader>ar :AIRedo<CR>


" }}}


nnoremap <leader>f :GFiles<CR>

tnoremap <esc> <C-\><C-N><CR>

"let g:rustfmt_autosave = 1

" map <f8> :Cargo build<CR>
map <f9> :Cargo run<CR>

map <f5> :!python %<CR>

set termguicolors

set showcmd

set cmdheight=1

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" nnoremap <F8> :w <bar> !python % <CR>
" nnoremap <F8> :w <bar> !cargo run <CR>
" nnoremap <F8> :w <bar> !java % <CR>

"set showcmd
" vim:foldmethod=marker:foldlevel=0
