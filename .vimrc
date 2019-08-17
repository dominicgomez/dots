syntax on


call plug#begin('~/.vim/plugged')
Plug 'hdima/python-syntax'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-syntax-extra'
Plug 'ycm-core/YouCompleteMe'
call plug#end()


set autochdir
set autoindent
set background=dark
set backspace=start,indent,eol
set colorcolumn=80
set completeopt-=preview
set cursorcolumn
set cursorline
set expandtab
set hlsearch
set modeline
set mouse=a
set number
set printfont=courier:h10
set printheader=%F%=%N
set printoptions=left:36pt,right:36pt,top:36pt,bottom:36pt,header:1,number:y
set ruler
set scrolloff=0x5d
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
set textwidth=79


let g:mapleader = ','

" python-syntax
let g:python_highlight_all = 1

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_cursor_columns = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = &lines/10
let g:syntastic_python_checkers = ['flake8']

" tagbar
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" vim-colorschemes
colorscheme gruvbox

" vim-commentary
nmap <silent> <Leader>c gcc
vmap <silent> <Leader>c gc

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1


inoremap <silent> jj <Esc>
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <silent> <Leader><Space> :bnext<CR>
nnoremap <silent> <Leader>f :nohl<CR>
nnoremap <silent> <Leader>q :bprevious<CR>
nnoremap <silent> <Leader>r :execute 'source '.bufname('%')<CR>
nnoremap <silent> <Leader>v :source $MYVIMRC<CR>
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>x :bdelete<CR>


function! s:ResetCursorPos()
    if line("'\"") > 1 && line("'\"") <= line("$")
        exe "normal! g`\""
    endif
endfunction

function! s:StripTrailingWhitespace()
    silent! %s/\s\+$//e
endfunction


augroup basic
    autocmd!
    autocmd BufRead * call s:ResetCursorPos()
    autocmd BufWritePre * call s:StripTrailingWhitespace()
augroup END

augroup readme
    autocmd!
    autocmd BufRead,BufNewFile README set filetype=markdown
augroup END
