
"-----------------------------------------------------------------------------
" NeoBundle (Plugins)
"-----------------------------------------------------------------------------
source ~/dotfiles/bundles.vim

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------
source ~/dotfiles/vimrc-base.vim

"-----------------------------------------------------------------------------
" Custom mappings for plugins
"-----------------------------------------------------------------------------

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" opens nerd tree in project root dir
map <silent> <F6> :ToggleNERDTree<CR>
map <silent> <F7> :TagbarToggle<CR>

" Switch between complementary filetypes
" mnemonic: Go Switch
nnoremap gs :A<CR>

" Clear highlighting
nnoremap <leader>hc :nohl<CR><C-L>

"-----------------------------------------------------------------------------
" Plugin preferences
"-----------------------------------------------------------------------------
" Colorscheme
silent! colorscheme xoria256

" ultisnips snippet location
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"

" Use unicode symbols for powerline
let g:Powerline_symbols="unicode"

" Autocomplete menu options
set completeopt=longest,menuone

"-----------------------------------------------------------------------------
" Fugitive (Git plugin)
"-----------------------------------------------------------------------------
if has("autocmd")
    " Use .. to navigate up a tree when browsing fugitive history
    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

    " Automatically close hidden fugitive files. less buffer clutter
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif

"-----------------------------------------------------------------------------
" Neocomplete
"-----------------------------------------------------------------------------
source ~/dotfiles/neco-rc.vim

"-----------------------------------------------------------------------------
" Tagbar
"-----------------------------------------------------------------------------
source ~/dotfiles/tagbar-rc.vim

"-----------------------------------------------------------------------------
" Syntastic
"-----------------------------------------------------------------------------

" C++
let g:syntastic_cpp_compiler_options = ' -Wall -Werror -std=c++0x'
let g:syntastic_cpp_include_dirs = [ '/usr/include/qt4/Qt', '/usr/include/qt4', '/usr/include/qt4/QtGui', '/usr/include/qt4/QtCore' ]

" Haskell
let g:syntastic_haskell_ghc_mod_args = '-g -fno-warn-unused-binds -g -fwarn-incomplete-patterns'
let g:syntastic_haskell_hlint_args = '--ignore="Redundant bracket"'

" Python
let g:syntastic_python_checkers = ['python', 'flake8']

"-----------------------------------------------------------------------------
" CtrlP
"-----------------------------------------------------------------------------
let g:ctrlp_max_files=0


