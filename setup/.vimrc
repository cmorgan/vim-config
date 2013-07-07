set nocompatible
set title

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" macvim settings
" blinkning cursor off
set gcr=n:blinkon0
"set bg=dark

"let g:pep8_map='<F7>'

nnoremap <silent><C-x> :tabprevious<CR>
nnoremap <silent><C-c> :tabnext<CR>
nnoremap <silent><C-e> :tabnew<CR>
nnoremap <silent><C-r> :tabclose<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
" could not get the below to work with alt so use Ctl
nnoremap <silent><C-n> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-m> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>


" sources Vim sh
nmap \sh                  :source ~/.vim/vimsh/vimsh.vim<CR>

" Set region to British English
set spelllang=en_gb

" remap ESC to jj
imap jj <ESC>

" remap :b# to bb 
nnoremap df :b#<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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

"set cmdheight=2

" show the cursor position all the time
set ruler

" show commands
set showcmd

" do incremental searches (annoying but handy);
set incsearch

" Set ignorecase on
"set ignorecase

"Set status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LEN=%L]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [LEN=%L]
"set statusline=b:%n\ %f%R%Y%=%m[row\ %l/%L,\ column\ %v\ (%c)]
" Always display a status line at the bottom of the window
set laststatus=2

" A really status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
if &statusline == ''
	set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
	set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%=%-16(\ %l,%c-%v\ %)%P
end
set laststatus=2

hi StatusLine 
           \     cterm=NONE,bold ctermbg=darkgreen   ctermfg=white 
           \     gui=NONE,bold   guibg=darkgrey           guifg=black 

" showmatch: Show the matching bracket for the last ')'?
set showmatch

"set number
set nuw=4

" Toggle paste mode on/off with F2 key
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Turn on line numbers:
"set number
" Toggle line numbers and fold column for easy copying:
nnoremap <F3> :set number!<CR>:set foldcolumn=0<CR>

" Toggle NerdTree
nnoremap <F4> :NERDTreeToggle<CR>

" treat wsgi files as python
filetype on
au BufNewFile,BufRead *.wsgi set filetype=python

call pathogen#infect()
Helptags
" indenting tailored for pyhton, uses python.vim in ~/.vim/indent
filetype plugin indent on

" syntax, uses python.vim .vim/syntax
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Define rst fles to be highlighted as rst
" rst syntax from: http://www.vim.org/scripts/script.php?script_id=973
" also rst modules: http://www.vim.org/scripts/script.php?script_id=1334
autocmd BufRead *.rst set syntax=rest

":map <C-p> :w<CR>:!pdflatex %<CR>
":map <C-l> :w<CR>:!latex %<CR>

" , #perl # comments
map ,# :s/^/%/<CR>

set clipboard=unnamed

se t_Co=256
"let g:solarized_termcolors=16
syntax enable
"set background=light
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

" when indenting in visual mode keep the block highlighted
vnoremap < <gv
vnoremap > >gv

" all my .tmpl files ARE html
au BufNewFile,BufRead *.tmpl :set ft=html

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw
" command-line completion operates in an enhanced mode
set wildmenu

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" ----------- Vimux
" Run the current file with rspec
"map <Leader>rb :call VimuxRunCommand("ls " . bufname("%"))<CR>
" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand(". /home/chris/.virtualenvs/reddeer/bin/activate;clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>rl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>ri :VimuxInspectRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :VimuxClosePanes<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>rq :VimuxCloseRunner<CR> " ----------- /Vimux

set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" save a keystroke!
nnoremap ; :

nnoremap j gj
nnoremap k gk

nmap <silent> ,/ :nohlsearch<CR>

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
let g:Powerline_colorscheme='solarized256_dark'
"autocmd FileType python compiler pylint
" treat shell as login shell
set shellcmdflag=-ic
