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

" Make the escape key more responsive.
set ttimeout
set ttimeoutlen=100

" Search matches are shown as you type.
set incsearch

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
" Make the search window take up 90% of the width and 75% of the height.
let g:fzf_layout={'window': { 'width': 0.90, 'height': 0.75, 'relative': v:true, 'yoffset': 1.0}}

" Vimux configuration.
" Open the pane with a vertical split instead of a horizontal one.
let g:VimuxOrientation = "v"
" The vertical pane takes up 20% of the height.
let g:VimuxHeight = "20%"
" Slime-like functionality.
" Sends the contents of the register to the REPL.
function! VimuxSlime()
    " Remove blank lines.
    let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
    let no_empty_lines = substitute(@v, empty_lines_pat, "", "g")
    " Send the contents of the register to the REPL.
    call VimuxRunCommand(no_empty_lines)
endfunction

" Don't show icons in statusline.
let g:webdevicons_enable_airline_statusline=0

" Custom mappings.
let mapleader=" "
" Mappings for managing buffers.
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bd :bd<CR>
" Mappings for FZF.
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fl :Rg<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :Helptags<CR>
" Mappings for Vimux.
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vr :VimuxRunLastCommand<CR>
nnoremap <Leader>vl :VimuxClearTerminalScreen<CR>
nnoremap <Leader>vi :VimuxInterruptRunner<CR>
nnoremap <Leader>vo :VimuxOpenRunner<CR>
nnoremap <Leader>vc :VimuxCloseRunner<CR>
" Copy the highlighted text to the register and send it to the REPL.
vnoremap <Leader>vs "vy :call VimuxSlime()<CR>
" Mappings for NERDTree.
nnoremap <Leader>nt :NERDTreeToggle<CR>
" Mappings for Fugitive.
nnoremap <Leader>gs :Git<CR>
" Mappings for code formatting/linting.
nnoremap <Leader>lb :Black<CR>
" Mappings for Python.
" Insert a breakpoint.
nnoremap <Leader>di ibreakpoint()<Esc>
" Mappings for easy changes to vimrc.
nnoremap <Leader>re :split $MYVIMRC<CR>
nnoremap <Leader>rs :source $MYVIMRC<CR>

" Make CursorLineNr and SignColumn have same background as CursorLine. This fixes an 
" issue with using the Solarized colourscheme. I can look into a better fix
" later.
highlight clear CursorLineNr
highlight CursorLineNr ctermfg=grey ctermbg=black
highlight SignColumn ctermfg=grey ctermbg=black
