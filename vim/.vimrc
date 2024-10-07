" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'altercation/vim-colors-solarized'
    Plug 'preservim/vimux'
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'ryanoasis/vim-devicons'
    Plug 'psf/black', {'branch': 'stable'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex'
call plug#end()

" Set encoding
set encoding=utf-8

" Colorscheme
set background=dark
colorscheme solarized

" Font settings
let g:solarized_bold=1
let g:solarized_italic=1

" Change buffer
map gn :bn <CR>
map gp :bp <CR>
map gd :bd <CR>

" Line numbering and autoindent
set number
set autoindent

" 4 space tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Syntax highlighting
syntax on

" Enables cursorline
set cursorline

" Sets a horizontal guide
set colorcolumn=88

" Enable folding
set foldmethod=indent
set foldlevel=99

" Airline configuration
set noshowmode
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline_theme="solarized"
let g:airline_powerline_fonts=1

" NerdTree file explorer toggle
map <C-e> :NERDTreeToggle <CR>

" Bind FZF
nnoremap <C-r> :GFiles<CR>

" Change FZF layout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 }}

" Create default mappings for NerdCommenter
let g:NERDCreateDefaultMappings=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Simple column symbol
let g:airline_symbols.colnr = ' C:'

" Run Black
map <C-f> :Black <CR>

" To get proper backspaces
set backspace=indent,eol,start

" Insert IPDB break
map <C-p> iimport ipdb; ipdb.set_trace() <Esc>

" For VimTex to work properly
filetype plugin indent on

" VimMux configuration
map <C-j> :VimuxPromptCommand <CR>
map <C-k> :VimuxRunLastCommand <CR>
map <C-l> :VimuxClearTerminalScreen <CR>
map <C-o> :VimuxCloseRunner <CR>
let g:VimuxOrientation = "v"
let g:VimuxHeight = "20"

" Make CursorLineNr and SignColumn have same background as CursorLine
highlight clear CursorLineNr
highlight CursorLineNr ctermfg=grey ctermbg=black
highlight SignColumn ctermfg=grey ctermbg=black
