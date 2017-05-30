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
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'elzr/vim-json'
NeoBundle 'junegunn/vim-emoji'
" NeoBundle 'klen/python-mode'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'fatih/vim-go'
NeoBundle 'posva/vim-vue'
NeoBundle 'sbdchd/neoformat'


call neobundle#end()

 " Required:
filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck

" colorsss
colorscheme base16-ocean
set termguicolors 		" true color 
set background=dark

" neovims magic
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

"""""
" END OF NEO BUNDLE
"""""

" Show programming syntax
syntax on

" Show lines 
set number

" show spaces / tabs
set list

" config to soft tab
set softtabstop=2 shiftwidth=2 expandtab

" Set outside file
set autoread

"Copy indent from current line when starting a new line
set autoindent 
"when we autoindent, backspace will delete the entire tab width, not just individual spaces
set smarttab 
set smartindent

" Always show status 
set laststatus=2

"searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

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

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
nmap ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeFind<CR>

let g:vim_json_syntax_conceal = 0

let g:jsx_ext_required = 0

let g:vim_markdown_folding_disabled=1

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|virtualenv)|(\.(swp|ico|git|svn))$'

set completefunc=emoji#complete
function! ConvertToEmoji()
  execute '%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g'
endfunction
command! ConvertToEmoji call ConvertToEmoji()
nmap <silent> <c-e> :call ConvertToEmoji()
vmap <silent> <c-e> :call ConvertToEmoji()


""""""""""""""""""""""""""""""
" => Go section
"""""""""""""""""""""""""""""""

au FileType go set nolist
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go setl et ts=8 sw=8 

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" neo format
let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--single-quote', '--stdin', '--print-width 140'],
            \ 'stdin': 1, 
            \ }
let g:neoformat_enabled_javascript = ['prettier']

"augroup fmt
"  autocmd!
"  autocmd BufWritePre * Neoformat
"augroup END

