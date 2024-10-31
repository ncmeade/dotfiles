" Plugins {{{
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'altercation/vim-colors-solarized'
    Plug 'sheerun/vim-polyglot'
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
" }}}

" Vimscript folding {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" General {{{
" Make the escape key more responsive.
set ttimeout
set ttimeoutlen=100

" Search matches are shown as you type.
set incsearch

" Use absolute line numbering.
set number

" Use a cursorline to show position in file.
set cursorline

" Set a vertical guide for line length.
set colorcolumn=88

" Unfold by default.
set foldlevelstart=99

" Infer settings based on file type.
filetype plugin indent on

" Show existing tabs with four space width.
set tabstop=4

" Use four spaces when indenting.
set shiftwidth=4

" Use four spaces when pressing tab.
set expandtab
" }}}

" Colourscheme {{{
" Use the Solarized colourscheme. See: https://ethanschoonover.com/solarized/
set background=dark
colorscheme solarized

" Make CursorLineNr and SignColumn have same background as CursorLine. This fixes an 
" issue with using the Solarized colourscheme. I can look into a better fix later.
highlight clear CursorLineNr
highlight CursorLineNr ctermfg=grey ctermbg=black
highlight SignColumn ctermfg=grey ctermbg=black
" }}}

" Airline {{{
" Let Airline handle the mode.
set noshowmode

" Show buffers when only one tab is open.
let g:airline#extensions#tabline#enabled=1

" Disable the detection of whitespace errors.
let g:airline#extensions#whitespace#enabled=0
"
" Show the tail (last component) of the filename.
let g:airline#extensions#tabline#fnamemod=":t"

" Use Airline theme to match colourscheme.
let g:airline_theme="solarized"

" Use fancy fonts.
let g:airline_powerline_fonts=1
" }}}

" Devicons {{{
" Disable fancy icons in the statusline.
let g:webdevicons_enable_airline_statusline=0
" }}}

" FZF {{{
" Make the search window take up 95% of the width and 95% of the height.
let g:fzf_layout = {'window': { 'width': 0.95, 'height': 0.95, 'relative': v:true, 'yoffset': 1.0}}

" Send everything that's selected to the quickfix list.
function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	copen
	cc
endfunction

" Bindings for when FZF is open.
let g:fzf_action = {
	\ 'ctrl-q': function('s:build_quickfix_list'),
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }

" Make <C-a> select everything.
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
" }}}

" Vimux {{{
" Open the pane with a vertical split instead of a horizontal one.
let g:VimuxOrientation = "v"
"
" The vertical pane takes up 20% of the height.
let g:VimuxHeight = "20%"

" Slime-like functionality. Sends the contents of the register to the REPL.
function! VimuxSlime()
    " Remove blank lines.
    let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
    let no_empty_lines = substitute(@v, empty_lines_pat, "", "g")
    " Send the contents of the register to the REPL.
    call VimuxRunCommand(no_empty_lines)
endfunction
" }}}

" VimTeX {{{
" Use Zathura as the viewer.
let g:vimtex_view_method = 'zathura'
" }}}

" Mappings {{{
let mapleader=" "

" Buffer management
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bd :bd<CR>

" FZF
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fl :Rg<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :Helptags<CR>

" Vimux
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vr :VimuxRunLastCommand<CR>
nnoremap <Leader>vb :call VimuxRunCommand("python3 " . bufname("%"))<CR>
nnoremap <Leader>vl :VimuxClearTerminalScreen<CR>
nnoremap <Leader>vc :VimuxInterruptRunner<CR>
vnoremap <Leader>vs "vy :call VimuxSlime()<CR>

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Fugitive
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gl :Git log<CR>

" Miscellaneous
nnoremap <Leader>lb :Black<CR>
nnoremap <Leader>di ibreakpoint()<Esc>
nnoremap <Leader>re :split $MYVIMRC<CR>
nnoremap <Leader>rs :source $MYVIMRC<CR>
" }}}
