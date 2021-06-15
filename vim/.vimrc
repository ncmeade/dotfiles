" Setup colourscheme 
set background=dark
colorscheme gruvbox

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

" Execute current buffer
nnoremap <F1> :!python %

" Airline configuration
set noshowmode
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline_theme="gruvbox"

" Add fzf
set rtp+=~/.fzf

" Customize fzf colors to match colour scheme
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

" NerdTree file explorer toggle
map <C-e> :NERDTreeToggle <CR>

" ALE toggle
nnoremap <F2> :ALEToggle <CR>
