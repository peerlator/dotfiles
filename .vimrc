" General
" {{{

filetype plugin on
filetype indent on
set history=500

set autoread
au FocusGained,BufEnter * checktime


set noswapfile
set nobackup
set nowritebackup

set t_Co=256
set encoding=UTF-8

" }}}

" Plugins
" {{{
call plug#begin('~/.vim/plugged')

Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'iCyMind/NeoSolarized'
Plug 'vim-scripts/indentpython.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-python/python-syntax'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 
Plug 'francoiscabrol/ranger.vim'
Plug 'Chrisbra/Colorizer'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'SirVer/ultisnips'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

" }}}


" User Interface 
" {{{
" Lines up and down from cursor
set so=7 

set ruler
set cmdheight=1
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set cursorline
set wildmenu 
set showmatch

set ignorecase
set hlsearch
set incsearch

set lazyredraw
set magic

set noerrorbells
set novisualbell
set t_vb=
set tm=500
set number 

syntax on
set background=dark
colorscheme NeoSolarized 
hi CursorLineNr cterm=NONE

" ligthline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
set noshowmode

" }}}


" Other stuff
" {{{
filetype indent on      

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap Lines

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

set modeline
set modelines=5
" }}}


" remapings 
" {{{
let mapleader = " "
nnoremap ; :

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
imap jj <Esc>
" delete highlights from search
nnoremap <leader><leader> :nohlsearch<CR>
" unfold
nnoremap <leader><Enter> za
" move per visual line
nnoremap j gj
nnoremap k gk

nnoremap <C-e> t_ 

" Remap to beginning/end of line
nnoremap <S-h> ^
nnoremap <S-l> $

" Add a date timestamp between two new lines.
nnoremap <leader>d :r! echo "" && date && echo ""<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>a :Ag<CR>

" convenience
map :qw :wq
map :W :w

" sudo save
cmap w!! w !sudo tee > /dev/null %

" NerdTree
map <leader>f :NERDTreeToggle<CR>
map <leader>l :ALEToggle<CR>
map <leader>ds :Pydocstring<CR>
nmap <silent> <C-_> <Plug>(pydocstring)

nmap <silent> gd <Plug>(coc-definition)

let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" }}}

" Language specific
" {{{
filetype plugin indent on

"python 
au BufNewFile,BufRead *.py
    \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.cpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.hpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.jade setlocal expandtab ts=2 sw=2

au BufWritePost *.scss :silent !sassvim <afile>
" }}}

" Plugin specific
" {{{
" NERDTree
let NERDTreeShowHidden=1

" Black
autocmd BufWritePre *.py execute ':Black'
let g:black_linelength=79
" emmet
let g:user_emmet_leader_key=','

" Ale
let g:ale_enabled = 0
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

" Vim fugitive
set diffopt+=vertical

" Vim Python Syntax
let g:python_highlight_all = 1

let g:instant_markdown_autostart = 0
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" }}}

" vim: set foldmethod=marker: 
