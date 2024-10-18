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
    Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex'
call plug#end()

" Use the Solarized colourscheme. For more information on Solarized, see:
" https://ethanschoonover.com/solarized/.
set background=dark
colorscheme solarized

" Use bold and italic fonts.
let g:solarized_bold=1
let g:solarized_italic=1

" Use absolute line numbering.
set number

" Use a cursorline to show position in file.
set cursorline

" Set a vertical guide for line length.
set colorcolumn=88

" Use four space tabs.
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Automatically convert tabs to spaces.
set expandtab

" Code folding configuration.
" Fold based on indentation.
set foldmethod=indent
" Unfolded by default.
set foldlevel=99

" Set the file type plugins.
" This is needed by VimTeX, for instance.
filetype plugin indent on

" Airline configuration.
" Let Airline handle it.
set noshowmode
" Show buffers when only one tab is open.
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=0
" Show the tail (last component) of the filename.
let g:airline#extensions#tabline#fnamemod=":t"
let g:airline_theme="solarized"
let g:airline_powerline_fonts=1

" FZF configuration.
" Make the search window take up 90% of the width and 60% of the height.
let g:fzf_layout={'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0}}

" Vimux configuration.
" Open the pane with a vertical split instead of a horizontal one.
let g:VimuxOrientation = "v"
" The vertical pane takes up 20% of the height.
let g:VimuxHeight = "20%"

" Custom mappings.
let mapleader=" "
" Mappings for managing buffers.
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bd :bd<cr>
" Mappings for FZF.
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fl :Rg<cr>
nnoremap <leader>fb :Buffers<cr>
" Mappings for Vimux.
nnoremap <leader>vp :VimuxPromptCommand<cr>
nnoremap <leader>vl :VimuxRunLastCommand<cr>
nnoremap <leader>vc :VimuxCloseRunner<cr>
" Mappings for NERDTree.
nnoremap <leader>nt :NERDTreeToggle<cr>
" Mappings for Fugitive.
nnoremap <leader>gs :Git<cr>
" Mappings for code formatting/linting.
nnoremap <leader>lb :Black<cr>
" Mappings for Python.
" Insert a breakpoint.
nnoremap <leader>di ibreakpoint()<esc>
" Mappings for easy changes to vimrc.
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Make CursorLineNr and SignColumn have same background as CursorLine. This fixes an 
" issue with using the Solarized colourscheme. I can look into a better fix
" later.
highlight clear CursorLineNr
highlight CursorLineNr ctermfg=grey ctermbg=black
highlight SignColumn ctermfg=grey ctermbg=black
