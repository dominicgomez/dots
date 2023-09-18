set nocompatible
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'pulkomandy/c.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'frazrepo/vim-rainbow'
Plug 'jmcantrell/vim-virtualenv'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'jantimon/html-webpack-plugin'
Plug 'systemjs/plugin-css'
Plug 'djoshea/vim-autoread'
Plug 'lervag/vimtex'
call plug#end()

" Add merlin (for Ocaml) to vim's runtime path.
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

set autochdir
set autoindent
set autoread
set backspace=start,indent,eol
set expandtab
set foldmethod=marker
set mouse=a
set scrolloff=999
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=8

syntax on
set background=dark
set colorcolumn=80,120
set completeopt=menu,menuone,popuphidden
set cursorcolumn
set cursorline
set hlsearch
" 2 is always show statusline
set laststatus=2
set number
" use 24-bit color
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:lightline = { 'colorscheme': 'gruvbox' }

if has('gui_running')
    set antialias
    set background=dark
    set columns=90
    set guioptions-=L
    set guioptions-=r
    set lines=0xDA
    " Both mac and linux will return true for `has('unix')`, but only mac will
    " return true for `has('macunix')`, so check 'macunix' first.
    " Mac and Debian fonts are named differently. GUI options are also
    " different.
    if has('macunix')
        set guifont=Inconsolata-Regular:h14
    elseif has('unix')
        set guifont=Inconsolata\ Medium\ 14
        set guioptions-=m
        set guioptions-=T
    endif

    colorscheme gruvbox
    let g:gruvbox_contrast_dark = 'hard'
    let g:lightline = { 'colorscheme': 'gruvbox' }
endif

set printfont=courier:h10
" absolute path of file on the left and printer page number on the right.
set printheader=%F%=%N
set printoptions=left:36pt,right:36pt,top:36pt,bottom:36pt,header:1,number:y

let g:mapleader = ','

let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_echo_current_error=1
let g:syntastic_cursor_columns=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=8
let g:syntastic_python_checkers=['flake8']

let g:ycm_auto_hover=''
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_filepath_completion_use_working_dir=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1

inoremap jj <ESC>
nnoremap <silent> <Leader>w :write<CR>
" reload current file
nnoremap <silent> <Leader>r :source %
nmap <silent> <Leader>c gcc
vmap <silent> <Leader>c gc
" nmap <silent> <Leader>z za
nmap <silent> <Leader>z zA
" Close all folds in a file
nmap <silent> <Leader><S-z> zM
nnoremap <silent> <Leader>f :nohl<CR>

" nnoremap <Leader>b :buffers<CR>:buffer<Space>
" nnoremap <silent> <Leader><Space> :bnext<CR>
" nnoremap <silent> <Leader>q :bprevious<CR>
" nnoremap <silent> <Leader>x :bdelete<CR>

nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" vimdiff
nnoremap <silent> <Leader>n ]c
nnoremap <silent> <Leader><S-n> [c

function! s:ResetCursorPosition()
    if line("'\"") > 1 && line("'\"") <= line("$")
        exe "normal! g`\""
    endif
endfunction

function! s:StripTrailingWhitespace()
    silent! %s/\s\+$//e
endfunction

augroup basic
    autocmd!
    autocmd BufRead * call s:ResetCursorPosition()
    autocmd BufWritePre * call s:StripTrailingWhitespace()
augroup END

augroup py
    autocmd!
    autocmd FileType python set columns=90 textwidth=79
augroup END

augroup readme
    autocmd!
    autocmd BufRead,BufNewFile README set filetype=markdown
augroup END

augroup web
    autocmd!
    autocmd FileType html set shiftwidth=2 softtabstop=2
    autocmd FileType css set shiftwidth=2 softtabstop=2
    autocmd FileType javascript set shiftwidth=2 softtabstop=2
augroup END
