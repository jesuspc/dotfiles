set nocompatible

if has('nvim')
  runtime! plugin/python_setup.vim
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  " Hack to get C-h working in neovim
  nmap <BS> <C-W>h
  tnoremap <Esc> <C-\><C-n>
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------- Plugins ----------
Plugin 'gmarik/Vundle.vim'

" == Vim Improvements ==
Plugin 'tpope/vim-repeat'
Plugin 'jwhitley/vim-matchit'
Plugin 'kana/vim-textobj-user'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-dispatch'
Plugin 'benmills/vimux'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tmhedberg/matchit'
Plugin 'sickill/vim-pasta'
Plugin 'szw/vim-ctrlspace'

" == Interface ==
Plugin 'bling/vim-airline'

" == Navigation ==
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" == Search ==
Plugin 'rking/ag.vim'

" == File Edition ==
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'

" == Visuals ==
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

" == Source Control ==
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

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
Plugin 'tpope/vim-bundler'

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

" Enable syntax highlight
syntax on

" Wrapping for long lines
set nowrap

" Display line number
" set relativenumber
set number

" Clipboard integration
set clipboard=unnamed
" Go into pastemode temporarly on keypress
set pastetoggle=<F2>

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
nmap <leader>, :e ~/.vimrc<CR>

" Clear search highlight
nnoremap <silent><ESC> :nohlsearch<CR><ESC>

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
let g:NERDTreeMouseMode = 3

" Ignore *.o files
let NERDTreeIgnore = [ '\.o$', '\.meta$' ]

" Open NERDTree when vim starts
autocmd vimenter * if argc() == 0 | NERDTree | endif

nnoremap <leader>n :NERDTreeToggle<CR>

" =========== Airline ===========
" Use better separators
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

" =========== UltiSnips ==========
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" =========== Vim Test ===========
let test#strategy = "dispatch"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" =========== Vimux ============
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" if text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<cr>

" select current paragraph and send it to tmux
nmap <Leader>vs vip<Leader>vs<cr>

" ========== Easy Motion ===========
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>/ <Plug>(easymotion-sn)

" ========== Syntastic ===========
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" ========== Visualization  ==========
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
let base16colorspace=256
"colorscheme solarized
colorscheme base16-default

" ========= Scrolling ===========

function SmoothScroll(up)
  if a:up
    let scrollaction="^Y"
  else
    let scrollaction="^E"
  endif
  exec "normal " . scrollaction
  redraw
  let counter=1
  while counter<&scroll
    let counter+=1
    sleep 10m
    redraw
    exec "normal " . scrollaction
  endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

set mouse=a

" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    exec t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <M-z> :ZoomToggle<CR>
nnoremap <silent> <M-m> :ZoomToggle<CR>
