" Plugins {{{
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'preservim/vimux'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-fugitive'
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

" You do not need to save before changing buffers.
set hidden

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
set background=dark

" Make the sign column the same colour as the background.
let g:gruvbox_sign_column = 'bg0'

colorscheme gruvbox
" }}}

" CoC {{{
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable delay.
set updatetime=300

" Always show the signcolumn.
set signcolumn=yes

" Check if the last character in the column is whitespace.
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Show documentation for symbol cursor is on.
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction
" }}}

" Airline {{{
" Let Airline handle the mode.
set noshowmode

" Show buffers when only one tab is open.
let g:airline#extensions#tabline#enabled=1

" Disable the detection of whitespace errors.
let g:airline#extensions#whitespace#enabled=0

" Show the tail (last component) of the filename.
let g:airline#extensions#tabline#fnamemod=":t"

" Use Airline theme to match colourscheme.
let g:airline_theme="gruvbox"

" Do not use fancy fonts.
let g:airline_powerline_fonts=0
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

" NERDCommenter {{{
" Add spaces after comment delimiters. 
let g:NERDSpaceDelims=1

" Do not create default mappings.
let g:NERDCreateDefaultMappings=0
" }}}

" Netrw {{{
" Make the window 20% of the width.
let g:netrw_winsize = 20
" }}}

" VimTeX {{{
" Use Zathura as the viewer.
let g:vimtex_view_method = 'zathura'

" Stop the quickfix window from being opened automatically.
let g:vimtex_quickfix_mode=0
" }}}

" Vimux {{{
" Open the pane with a vertical split instead of a horizontal one.
let g:VimuxOrientation = "v"

" The vertical pane takes up 20% of the height.
let g:VimuxHeight = "20%"

" Change the prompt string.
let g:VimuxPromptString = "> "

" Slime-like functionality. Sends the contents of the register to the REPL.
function! VimuxSlime()
    " Remove blank lines.
    let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
    let no_empty_lines = substitute(@v, empty_lines_pat, "", "g")
    " Send the contents of the register to the REPL.
    call VimuxRunCommand(no_empty_lines)
endfunction
" }}}

" Mappings {{{
let mapleader=" "

" Buffer management
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>ba :badd 
nnoremap <Leader>bd :bd<CR>

" CoC
inoremap <expr><silent> <Tab> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
nnoremap <Leader>lf <Plug>(coc-format)
nnoremap <Leader>le :<C-u>CocList diagnostics<CR>
nnoremap <silent> <Leader>ld <Plug>(coc-definition)
nnoremap <silent> <Leader>lr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

" Fugitive
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gl :Git log<CR>

" FZF
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fs :GFiles?<CR>
nnoremap <Leader>fl :Rg<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fth :Helptags<CR>
nnoremap <Leader>fcg :Commits<CR>
nnoremap <Leader>fcb :BCommits<CR>
nnoremap <Leader>fhc :History:<CR>
nnoremap <Leader>fhs :History/<CR>

" Miscellaneous
nnoremap <Leader>di i breakpoint()<Esc>==^
nnoremap <Leader>re :split $MYVIMRC<CR>
nnoremap <Leader>rs :source $MYVIMRC<CR>

" NERDCommenter
nnoremap <Leader>c <Plug>NERDCommenterToggle
vnoremap <Leader>c <Plug>NERDCommenterToggle

" Netrw
nnoremap <Leader>nt :Lexplore<CR>

" Vimux
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vr :VimuxRunLastCommand<CR>
nnoremap <Leader>vb :call VimuxRunCommand("python3 " . bufname("%"))<CR>
nnoremap <Leader>vl :VimuxClearTerminalScreen<CR>
nnoremap <Leader>vc :VimuxInterruptRunner<CR>
vnoremap <Leader>vs "vy :call VimuxSlime()<CR>

" Quickfix list
nnoremap <Leader>qo :copen<CR>
nnoremap <Leader>qc :cclose<CR>
nnoremap <Leader>qn :cnext<CR>
nnoremap <Leader>qp :cprev<CR>
" }}}
