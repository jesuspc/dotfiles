set nocompatible
set hidden

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
Plugin 'justinmk/vim-sneak'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'kassio/neoterm'
Plugin 'benekastah/neomake'
Plugin 'terryma/vim-expand-region'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-projectionist'
Plugin 'gcmt/wildfire.vim'

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

" == Testing ==
Plugin 'janko-m/vim-test'

" ---- Language Related ----

" ====== Ruby ======
Plugin 'vim-ruby/vim-ruby'
Plugin 'nelstrom/vim-textobj-rubyblock'
runtime macros/matchit.vim
if has("autocmd")
  filetype indent plugin on
endif
Plugin 'tpope/vim-bundler'

" = Rails =
Plugin 'tpope/vim-rails'

" ====== Javascript ======
Plugin 'pangloss/vim-javascript'

" == Node ==
Plugin 'moll/vim-node'

" ====== Elixir ======
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

" Wrapped lines goes down/up to next row
noremap j gj
noremap k gk

" Display line number
" set relativenumber
set number

set cursorline

set wildmenu

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
nmap <leader>m :e ~/.vimrc<CR>
augroup reload_vimrc " {o8
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Search before <CR>
set incsearch

" Clear search highlight
nnoremap <silent><ESC> :nohlsearch<CR><ESC>

nnoremap Y y$

" Visual shifting
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection
vnoremap . :normal .<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=<Paste>

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

" =========== Go to file =============
set suffixesadd+=.js

" =========== Git =========

" Spell checking and automatic wrapping at the recommended 72 columns to
" commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

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
let g:airline_exclude_preview = 1

" =========== UltiSnips ==========
let g:UltiSnipsExpandTrigger = "<nop>"
" Fixes incompatibility with vim endwise when expanding snippet with CR
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrReturnEmptyString()<CR>
function! s:ExpandSnippetOrReturnEmptyString()
    if pumvisible()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<C-y>\<CR>"
    endif
    else
        return "\<CR>"
endfunction
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" =========== Vim Test ===========
let test#strategy = "neoterm"
nnoremap <silent> <leader>c :call neoterm#close_all()<cr>
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
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>/ <Plug>(easymotion-sn)

" ========== NeoMake ==========
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_elixir_enabled_makers = ['elixir']
autocmd! BufWritePost * Neomake

" ========== CtrlP ============
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_user_command = {
  \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': s:ctrlp_fallback
\ }

" ========== Vim Projectionist ==========

" ========== Tagbar ==========
nnoremap <silent> <leader>tt :TagbarToggle<CR>

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
  \ }

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
   \ }

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

" Bg change
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
        colorscheme solarized
    else
        set background=dark
        colorscheme base16-default
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>

" Restore cursor position after swapping buffer
function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" slow multiple_cursors &amp; YCM
function! Multiple_cursors_before()
    let g:ycm_auto_trigger = 0
endfunction

function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
endfunction

" End/Start of line motion keys act relative to row/wrap width in the
" presence of `:set wrap`, and relative to line for `:set nowrap`.
" Default vim behaviour is to act relative to text line in both cases
function! WrapRelativeMotion(key, ...)
    let vis_sel=""
    if a:0
        let vis_sel="gv"
    endif
    if &wrap
        execute "normal!" vis_sel . "g" . a:key
    else
        execute "normal!" vis_sel . a:key
    endif
endfunction

" Map g* keys in Normal, Operator-pending, and Visual+select
noremap $ :call WrapRelativeMotion("$")<CR>
noremap <End> :call WrapRelativeMotion("$")<CR>
noremap 0 :call WrapRelativeMotion("0")<CR>
noremap <Home> :call WrapRelativeMotion("0")<CR>
noremap ^ :call WrapRelativeMotion("^")<CR>

" Overwrite the operator pending $/<End> mappings from above
" to force inclusive motion with :execute normal!
onoremap $ v:call WrapRelativeMotion("$")<CR>
onoremap <End> v:call WrapRelativeMotion("$")<CR>

" Overwrite the Visual+select mode mappings from above
" to ensure the correct vis_sel flag is passed to function
vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>
