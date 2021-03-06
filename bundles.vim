if has('vim_starting')
    set nocompatible

    " Required
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"let g:neobundle_default_git_protocol="git"

" Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" By the power of Shougo!
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'

"NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'nelstrom/vim-markdown-folding'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'godlygeek/tabular'

" Colorscheme
NeoBundle 'xoria256.vim'

" For automatically marking scripts as executable
NeoBundle 'Shebang'
" Provides :BD to close a buffer without closing the window
NeoBundle 'bufkill.vim'

NeoBundle 'NERD_tree-Project'
NeoBundle 'a.vim'

" haskell
"NeoBundle 'eagletmt/neco-ghc'
"NeoBundle 'eagletmt/ghcmod-vim'

" Personal Stuff
NeoBundle 'ckelau/autoload_cscope.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'Konfekt/FastFold'
NeoBundle 'nfvs/vim-perforce'


filetype plugin indent on     " required! 

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

call neobundle#end()
