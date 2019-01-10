" Dominic Gomez
" $HOME/.vimrc

" =============================================================================

" Plugins
" -------

call plug#begin("$HOME/.vim/plugged")
Plug 'flazz/vim-colorschemes'
Plug 'hdima/python-syntax'
Plug 'justinmk/vim-syntax-extra'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
call plug#end()

" =============================================================================

" Vim Variables
" -------------

let g:mapleader = ','

" =============================================================================

" Plugin Variables
" ----------------

" flazz/vim-colorschemes

" hdima/python-syntax
let g:python_highlight_all = 1

" justinmk/vim-syntax-extra

" octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" tpope/vim-commentary

" Valloric/YouCompleteMe
" FIXME
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 1

" vim-syntastic/syntastic
let g:syntastic_mode_map = {
\   'passive_filetypes': ['c', 'cpp'] }
let g:syntastic_ignore_files = [
\   '\S*\.[hc]\>',
\   '\S*\.\(C\|cc\|cpp\|hpp\)\>' ]
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = &lines/10
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_python_checkers = ['flake8']

" YouCompleteMe

" =============================================================================

" Functions
" ---------

" Move the cursor to its last known position in the buffer.
function! s:resetcursorpos()
    if line("'\"") > 1 && line("'\"") <= line("$")
        exe "normal! g`\""
    endif
endfunction
" Strip trailing whitespace.
function! s:rstrip()
    silent! %s/\s\+$//e
endfunction

" =============================================================================

" Key Mappings
" ------------

inoremap <silent> <Esc> <Esc>:write<CR>
inoremap <silent> jj <Esc>:write<CR>
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>v :source $MYVIMRC<CR>
nnoremap <silent> <Leader>r :execute 'source '.bufname('%')<CR>
" window navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
" comment toggling
" `gcc` and `gc` are defined by vim-commentary, so my own mappings that use
" them must be recursive.
nmap <silent> <Leader>c gcc
vmap <silent> <Leader>c gc

" =============================================================================

" Autocommands
" ------------

augroup basic_editor_features
    autocmd!
    autocmd BufRead * call s:resetcursorpos()
    autocmd BufWritePre * call s:rstrip()
augroup END

augroup python_files
    autocmd!
    autocmd FileType python set colorcolumn=80 textwidth=79
augroup END

" =============================================================================

" Options
" -------

set hlsearch
set modeline
" general
set autochdir
set mouse=a
set background=dark
set backspace=start,indent,eol
set completeopt-=preview
" appearance
set number
set ruler
" set cursorcolumn
" set cursorline
set background=light
set colorcolumn=80
" text formatting
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set textwidth=79
" printing
set printfont=courier:h10
set printheader=%F%=%N
set printoptions=left:36pt,right:36pt,top:36pt,bottom:36pt,header:1,number:y

" =============================================================================

" Syntax Highlighting
" -------------------

syntax on
colorscheme jellybeans
