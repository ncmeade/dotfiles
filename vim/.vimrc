" Colorscheme
set t_Co=16
set background=dark
colorscheme solarized8
let g:solarized_italics=0

" Airline
set noshowmode
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_theme="solarized"

" Change buffer
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" NerdTree file explorer toggle
map <C-e> :NERDTreeToggle<CR>

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

" Compile latex
nnoremap <F2> :!pdflatex %<Enter>

" Compile markdown
nnoremap <F3> :!pandoc % -f gfm -o %:r.pdf<Enter>

" Format current buffer
noremap <F4> :!black %
