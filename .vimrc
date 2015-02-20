"======================================================================="
" Vundle option:
"======================================================================="
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'ervandew/supertab'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'Townk/vim-autoclose'
Bundle 'bling/vim-airline'
Bundle 'plasticboy/vim-markdown'
Bundle 'derekwyatt/vim-scala'
Bundle 'jceb/vim-orgmode'
Bundle 'hsitz/VimOrganizer'
Bundle 'wavded/vim-stylus'
Bundle 'digitaltoad/vim-jade'
Bundle 'rstacruz/sparkup'
Bundle 'rizzatti/dash.vim'
"Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on     " required! (loads file type plugins + indentation)

" NOTE: comments after Bundle command are not allowed..
"======================================================================="

" vim5 and later versions support syntax highlighting. uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8

" Set colors
let g:solarized_termcolors=16
let g:solarized_termtrans =0
let g:solarized_degrade   =0
let g:solarized_bold      =1
let g:solarized_underline =1
let g:solarized_italic    =1
let g:solarized_contrast  ="normal"
let g:solarized_visibility="normal"

color solarized

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Make VIM faster!
"set synmaxcol=128
set ttyfast

" Set tab options
set softtabstop=4
set tabstop=4 shiftwidth=4      " a tab is 4 spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" Disable X server
set cb="exclude:.*"

" When you lose focus, save the file.
au FocusLost * :wa

" Set UI
set ruler
set rnu " Set relative number
set list " Show special characters (I specified below)
set listchars=tab:→\ ,trail:·
" set visualbell
set showbreak=↪\  " Show at the start of line of a wrapped line
set showmode
set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set scrolloff=7
set cursorline

"" Searching
set smartcase                   " ... unless they contain at least one capital letter

" Set search options
set incsearch " Incremental search
set hlsearch  " Highlight matches
set ignorecase " searches are case insensitive...
set smartcase " Do smart case matching (If they contain 1 capital letter, then
              " they become case sensitive

" Set behaviors
set autowrite " Automatically save before commands like :next and :make
set mouse=a " Enable mouse usage (all modes)
set autoindent
set autoread " Update open files when changed externally
set splitbelow " put the new window below of the current one
set splitright " put the new window right of the current one

" Set tab completion
set wildmode=list:longest,list:full  " Tab completion
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*

" Automatically reload vimrc when it's saved
augroup AutoReloadVimRC
  au!
  au BufWritePost .vimrc so ~/.vimrc
augroup END

" Set cursor to ibeam in insert mode and block in normal mode
if has("autocmd")
"  au InsertEnter * silent execute "!mateconftool-2 --type string --set /apps/mate-terminal/profiles/Default/cursor_shape ibeam"
"  au InsertLeave * silent execute "!mateconftool-2 --type string --set /apps/mate-terminal/profiles/Default/cursor_shape block"
"  au VimLeave * silent execute "!mateconftool-2 --type string --set /apps/mate-terminal/profiles/Default/cursor_shape block"
    if &term =~ '^xterm'
      " solid underscore
      let &t_SI .= "\<Esc>[4 q"
      " solid block
      let &t_EI .= "\<Esc>[2 q"
      " 1 or 0 -> blinking block
      " 3 -> blinking underscore
      " Recent versions of xterm (282 or above) also support
      " 5 -> blinking vertical bar
      " 6 -> solid vertical bar
endif

endif

autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif

autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd! BufNewFile,BufRead *.hn setlocal ft=c

" Start NERDTree when open vim without arg
autocmd VimEnter * if !argc() | NERDTree | endif
" Close vim when NERDTree is the only window left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Set relative number in normal mode, and line number in insert mode
autocmd InsertEnter * :set nu
autocmd InsertLeave * :set rnu

" Only have cursorline in current window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

autocmd BufWritePre *.{cpp,hpp,h,c,cc,hn,java,py} :call StripTrailingWhitespace()

"======================================================================="
" Key maps
"======================================================================="

set timeout
set timeoutlen=30
"set timeoutlen=400
set ttimeout
set ttimeoutlen=400
"set ttimeoutlen=10

" Set Alt mapping for all keys
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
" Remap leader to comma
let mapleader = "z"

"Write changes to protected read-only files.
cmap w!! %!sudo tee > /dev/null %

" Make Y copy from cursor to EOL
map Y y$

" Movement maps
nnoremap ; :
" nnoremap : ;
nnoremap j gj
nnoremap k gk
" nnoremap $ g$
" nnoremap ^ g^

" Reselect visual block after indentation
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Manage tabs
map tt :tabedit<Space>
map tm :tabmove<Space>
map tf :tabfind<Space>
map tn :tabnew<CR>
map th :tabprev<CR>
map tl :tabnext<CR>
map tj :tabfirst<CR>
map tk :tablast<CR>
map tc :tabclose<CR>
map <C-h> :tabprev<CR>
map <C-l> :tabnext<CR>
" Map t<i> to tab ith
for i in range(1,9)
  exec 'map t'.i.' '.i.'gt'
endfor

" Better command line editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Keep search term at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Manage buffers
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

" Manage windows
map <C-\> :vs<CR>
map <C-/> :sp<CR>
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>
nmap <silent> <A-Up> :wincmd -<CR>
nmap <silent> <A-Down> :wincmd +<CR>
nmap <silent> <A-Left> :wincmd <<CR>
nmap <silent> <A-Right> :wincmd ><CR>

nnoremap <silent> <Space> :set hlsearch! hlsearch?<CR>

" Nerdtree toogle
nmap <F2> :NERDTreeToggle<CR>

" TagBar toggle
nmap <F4> :TagbarToggle<CR>

" Run current line
nmap <F5> :.!sh<CR>

" Make 0 move back and forth between BOL and first word in line
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Char-48> SmartHome()

" Make F7 remove trailing white space
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
nmap <F7> :call StripTrailingWhitespace()<CR>

"======================================================================="
" Other settings
"======================================================================="

" Mark the 81 columns
if exists('+colorcolumn')
  set colorcolumn=81
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Enable persistent undo
if exists("+undofile")
  set udf
  set undodir=~/.vimundo
endif
" CtrlP settings
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.DS_Store'
      \ }

" Highlight Selection
hi Visual cterm=bold

" Set statusline
set laststatus=2                             " always show the status line

" Powerline/Airline
let g:airline_powerline_fonts = 1
let g:vim_markdown_folding_disabled=1

" VimOrganizer
let g:agenda_dirs=["~/Dropbox/Self"]
let g:org_agenda_select_dirs=["~/Dropbox/Self"]

