set nocompatible
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes' "colorschemes
Plug 'itchyny/lightline.vim' "statusline
Plug 'frazrepo/vim-rainbow' "rainbow parentheses
Plug 'tpope/vim-commentary' "easy (un)commenting
Plug 'ervandew/supertab' "autocomplete with <Tab>
Plug 'davidhalter/jedi-vim' "Python code completion
Plug 'dense-analysis/ale' "linting
Plug 'sheerun/vim-polyglot' "several language packs
Plug 'lervag/vimtex' "LaTeX plugin
call plug#end()

set autochdir
set autoindent
set autoread
set backspace=start,indent,eol
set expandtab
set foldmethod=marker
set mouse=a
" set scrolloff=0x5D
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=8

syntax on
set background=dark
set colorcolumn=80,120
" set completeopt=menu,menuone,popuphidden
set completeopt=menuone
set cursorcolumn
set cursorline
set hlsearch
set laststatus=2 "always show statusline
set number "line numbers
set termguicolors "24-bit color
colorscheme jellybeans
let g:lightline = {'colorscheme': 'jellybeans'}

if has('gui_running')
    set antialias
    set background=dark
    set columns=9999
    set guioptions-=L
    set guioptions-=r
    set lines=9999
    set guifont=Hack-Regular:h14
    colorscheme jellybeans
    let g:lightline = { 'colorscheme': 'jellybeans' }
endif

set printfont=courier:h10
" absolute path of file on the left and printer page number on the right.
set printheader=%F%=%N
set printoptions=left:36pt,right:36pt,top:36pt,bottom:36pt,header:1,number:y

let g:mapleader = ','

let g:jedi#show_call_signatures = "1"
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

inoremap jj <ESC>
nnoremap <silent> <Leader>w :write<CR>
" reload current file
nnoremap <silent> <Leader>r :source %<CR>
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

nmap <silent> <Leader><Space> gt
nmap <silent> <Leader>q gT
nmap <silent> <Leader>x :write<CR>:tabclose<CR>

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
    autocmd FileType python set textwidth=79
augroup END

augroup readme
    autocmd!
    autocmd BufRead,BufNewFile README set filetype=markdown
augroup END
