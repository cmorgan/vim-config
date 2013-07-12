set nocompatible               " be iMproved
filetype off                   " required!

set nocompatible
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
"export VIMRUNTIME=/usr/share/vim/vim74a

syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'tmhedberg/SimpylFold'
Bundle 'nvie/vim-flake8'
Bundle 'altercation/vim-colors-solarized'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'hdima/python-syntax'
Bundle 'nvie/vim-rst-tables'

let g:SimpylFold_docstring_preview = 1

nnoremap <silent><C-x> :tabprevious<CR>
nnoremap <silent><C-c> :tabnext<CR>
nnoremap <silent><C-e> :tabnew<CR>
nnoremap <silent><C-r> :tabclose<CR>

" Set region to British English
set spelllang=en_gb

" remap ESC to jj
imap jj <ESC>

" 4 stops
set tabstop=4
" 4 spaces for indenting
set shiftwidth=4
" spaces instead of tabs
set expandtab
" use 4 columns when you hit Tab 
set softtabstop=4

" set tabs for html
filetype on
filetype plugin on
"au BufNewFile,BufRead *.html set shiftwidth=2
au BufNewFile,BufRead *.html set softtabstop=2
au BufNewFile,BufRead *.html set tabstop=2
au BufNewFile,BufRead *.html set shiftwidth=2
au BufNewFile,BufRead *.html set textwidth=0
au BufNewFile,BufRead *.tmpl set textwidth=0

" change dir to the openec file dir
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

set textwidth=79
set autoindent
" show the cursor position all the time
set ruler
" show commands
set showcmd
" do incremental searches (annoying but handy);
set incsearch

set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Define rst fles to be highlighted as rst
" rst syntax from: http://www.vim.org/scripts/script.php?script_id=973
" also rst modules: http://www.vim.org/scripts/script.php?script_id=1334
autocmd BufRead *.rst set syntax=rest
se t_Co=256
"let g:solarized_termcolors=16
syntax enable
"set background=light
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
        \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
            \ }


" Toggle paste mode on/off with F2 key
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
