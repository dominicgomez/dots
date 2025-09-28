function! s:ResetCursorPosition()
    if line("'\"") > 1 && line("'\"") <= line("$")
        exe "normal! g`\""
    endif
endfunction

function! s:StripTrailingWhitespace()
    silent! %s/\s\+$//e
endfunction

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale' "linting
Plug 'davidhalter/jedi-vim' "Python code completion
Plug 'ervandew/supertab' "autocomplete with <Tab>
Plug 'flazz/vim-colorschemes' "colorschemes
Plug 'frazrepo/vim-rainbow' "rainbow parentheses
Plug 'itchyny/lightline.vim' "statusline
Plug 'lervag/vimtex' "LaTeX plugin
Plug 'sheerun/vim-polyglot' "several language packs
Plug 'tpope/vim-commentary' "easy (un)commenting
call plug#end()

" keys
" ----
inoremap jj <ESC>
let g:mapleader = ','
set mouse=a
" for common actions
nnoremap <silent> <Leader>w :write<CR>
" for comments
nmap <silent> <Leader>c gcc
vmap <silent> <Leader>c gc
" for folds
nmap <silent> <Leader>a za
" for tabs
nmap <silent> <Leader><Space> gt
nmap <silent> <Leader>q gT
nmap <silent> <Leader>x :write<CR>:tabclose<CR>
" for windows
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" editor
" ------
set autochdir
set autoread
set foldmethod=marker
set laststatus=2
set number
" gui
set guifont=Hack-Regular:h14
set guioptions-=L
set guioptions-=r
" colors
syntax on
colorscheme jellybeans
let g:lightline = {'colorscheme': 'jellybeans'}
set background=dark
set colorcolumn=80,120
set cursorcolumn
set cursorline
set hlsearch
set termguicolors
nnoremap <silent> <Leader>f :nohl<CR>
" indentation
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=8
" code completion
set completeopt=menuone
let g:jedi#show_call_signatures = "1"
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

" autocommands
" ------------
" for all files
augroup basic
    autocmd!
    autocmd BufRead * call s:ResetCursorPosition()
    autocmd BufWritePre * call s:StripTrailingWhitespace()
augroup END
" for LaTeX files
augroup math
    autocmd!
    autocmd FileType tex set textwidth=119
augroup END
" for Python files
augroup py
    autocmd!
    autocmd FileType python set textwidth=79
augroup END
