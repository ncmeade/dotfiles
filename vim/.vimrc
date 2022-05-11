" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'lifepillar/vim-solarized8'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'ycm-core/youcompleteme'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'psf/black', {'branch': 'stable'}
    Plug 'dense-analysis/ale'
call plug#end()

" Colorscheme
set background=dark
colorscheme solarized8

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

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
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline_theme="solarized"

" NerdTree file explorer toggle
map <C-e> :NERDTreeToggle <CR>

" Add FZF
set rtp+=~/.fzf

" Remove preview from YouCompleteMe
set completeopt-=preview

" Create default mappings for NerdCommenter
let g:NERDCreateDefaultMappings = 1

" Customize FZF colors to match colour scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Fall back unicode symbol.
let g:airline_symbols.colnr = ' C:'

" Run Black
map <C-f> :Black <CR>

" Open FZF
map <C-r> :FZF <CR>
