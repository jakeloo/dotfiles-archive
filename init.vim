if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Neobundle
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv.git'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'plasticboy/vim-markdown'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'bling/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'junegunn/vim-emoji'
" Plug 'klen/python-mode'
Plug 'vim-scripts/DrawIt'
Plug 'fatih/vim-go'
Plug 'posva/vim-vue'
Plug 'sbdchd/neoformat'

call plug#end()

 " Required:
filetype plugin indent on

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

