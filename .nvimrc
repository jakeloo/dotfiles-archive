" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

 " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

" Neobundle
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv.git'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'othree/html5.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'bling/vim-airline'

call neobundle#end()

 " Required:
filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck

"""""
" END OF NEO BUNDLE
"""""

" Show programming syntax
syntax on

" Show lines 
set number

" config to soft tab
set softtabstop=2 shiftwidth=2 expandtab

" Set outside file
set autoread
set smartindent

colorscheme base16-ocean
set background=dark

" Always show status 
set laststatus=2

" Remap arrow keys
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
" Remap arrow keys for insert mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
" Remap arrow keys for visual mode
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>

" Nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
nmap ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeFind<CR>

let g:vim_markdown_folding_disabled=1

let g:ctrlp_custom_ignore = {
      \  'dir' : '(node_modules|virtualenv)'
      \}





