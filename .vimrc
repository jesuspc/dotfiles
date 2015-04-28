set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------- Plugins ----------
Plugin 'gmarik/Vundle.vim'

" == Vim Improvements ==
Plugin 'tpope/vim-repeat'
Plugin 'jwhitley/vim-matchit'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-dispatch'

" == Interface ==
Plugin 'bling/vim-airline'

" == Navigation ==
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" == Search ==
Plugin 'mileszs/ack.vim'

" == File Edition ==
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-endwise'
Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'

" == Visuals ==
Plugin 'altercation/vim-colors-solarized'

" == Source Control ==
Plugin 'tpope/vim-fugitive'

" == Syntax ==
Plugin 'scrooloose/syntastic'

" == Testing ==
Plugin 'janko-m/vim-test'

" ---- Language Related ----

" == Ruby ==
Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'
runtime macros/matchit.vim
if has("autocmd")
  filetype indent plugin on
endif

" = Rails =
Plugin 'tpope/vim-rails'

" == Elixir ==
Plugin 'elixir-lang/vim-elixir'
Plugin 'mattreduce/vim-mix'

" All of your Plugins must be added before the following line
call vundle#end()

" ========== Basics ==========
let mapleader = ','

filetype off
filetype plugin indent on

" Enable mouse scrolling on tmux
set mouse=a

" Enable syntax highlight
syntax on

" Wrapping for long lines
set nowrap

" Display line number
set relativenumber

" Show matching brackets
set showmatch

" Autoread when the file is changed from the outside
set autoread

" Scroll to prevent the cursor from reaching the limits of the screen
set scrolloff=4

" Regular backspace
set backspace=2

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Turn off backups and swap
set nobackup
set noswapfile

" Column line
set colorcolumn=81

" Open .vimrc
nmap <leader>v :e ~/.vimrc<CR>

" ============ Persistent undo ============

set undodir=~/.vim/undodir
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" ============ Tabs and identation ============

set tabstop=2
set shiftwidth=2

set autoindent
set expandtab
set smarttab

" ============ Splits ============

" Open new split panes to right and bottom
set splitbelow
set splitright

" Move between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resizing splits
nnoremap <silent> + :vertical resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>

" =========== NERDtree ===========

" Don't ask to remove buffers when renaming or deleting files
let g:NERDTreeAutoDeleteBuffer = 1

" Ignore *.o files
let NERDTreeIgnore = [ '\.o$', '\.meta$' ]

" Open NERDTree when vim starts
autocmd vimenter * if argc() == 0 | NERDTree | endif

nnoremap <leader>n :NERDTreeToggle<CR>

" =========== Airline ===========
" Use better separators
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

" =========== Vim Test ===========
let test#strategy = "dispatch"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ========== Visualization  ==========
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
colorscheme solarized
