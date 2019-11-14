" General Settings
let mapleader = "\<Space>"

set autoread
set backup
set backupdir=/tmp//,.
set clipboard^=unnamedplus
set colorcolumn=+1
set directory=/tmp//,.
set expandtab
set hidden
set hlsearch
set ignorecase
set mouse=a
set nojoinspaces
set number
set pastetoggle=<F12>
set shell=$SHELL
set smartcase
set smartindent
set undodir=/tmp//,.
set undofile

augroup vimrc
  autocmd!
augroup END

" Remap jj to <Esc>
inoremap jj <Esc>

" Remap ; to :
nnoremap ; :

" Spell check
autocmd vimrc FileType gitcommit,markdown setlocal spell

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins (junegunn/vim-plug)
call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'haya14busa/vim-poweryank'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'rhysd/conflict-marker.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
call plug#end()

" base16-vim
let base16colorspace = 256
if filereadable(expand('~/.vimrc_background'))
  source ~/.vimrc_background
else
  colorscheme base16-eighties
endif

" fzf.vim
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
let $FZF_DEFAULT_COMMAND='
  \ hg files 2> /dev/null ||
  \ git ls-files 2> /dev/null ||
  \ ag --filename-pattern ""
  \'

" nerdtree
let NERDTreeQuitOnOpen = 1
nnoremap <Leader>n :NERDTreeToggle<CR>

" rainbow_parentheses.vim
autocmd vimrc FileType * RainbowParentheses

" tmuxline.vim
let g:tmuxline_powerline_separators = 0

" ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" vim-fugitive
nmap <Leader>g :Gstatus<CR>gg<c-n>

" vim-poweryank
map <Leader>y <Plug>(operator-poweryank-osc52)

" vim-signify
let g:signify_vcs_list = ['hg', 'git']

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
