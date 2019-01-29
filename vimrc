filetype plugin on
syntax on

if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'matze/vim-tex-fold'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

colorscheme jellybeans
let g:airline_theme='jellybeans'

"""
" Some nice default settings
"""
" Wrap back line on left/right movement
set whichwrap+=<,>,h,l,[,]
" BASIC CONFIG
set showcmd
set showmode
set mouse=a
" INDENTATION
set autoindent
set tabstop=4
set shiftwidth=4
" APPEARANCE
set relativenumber
set nowrap
set scrolloff=3
set sidescrolloff=3

" Turn off viminfo feature
let skip_defaults_vim=1
set viminfo=""

" Move between window by Ctrl+direction
no <C-j> <C-w>j 
no <C-k> <C-w>k 
no <C-l> <C-w>l 
no <C-h> <C-w>h 

"""
" NERDtree settings
"""
" Open if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open if opening on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Open with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Close vim if only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""
" LaTeX Commands
"""
" Set spell check on if we're in a LaTeX file
autocmd FileType tex setlocal spell
" \ll to save and compile file
" Note the regular expression stuff is to escape every character in the file
" name before we pass it to pdflatex
nnoremap <localleader>ll :w\|!pdflatex %:gs/./\\&/:p<CR>
