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

NeoBundle "chrisbra/color_highlight.git"
NeoBundle "skwp/vim-colors-solarized"
NeoBundle "itchyny/lightline.vim"
NeoBundle "jby/tmux.vim.git"
NeoBundle "gregsexton/gitv"
NeoBundle 'airblade/vim-gitgutter'
NeoBundle "tpope/vim-fugitive"
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'ahayman/vim-nodejs-complete', {'autoload':{'filetypes':['javascript']}}
NeoBundle "scrooloose/syntastic.git"
NeoBundle "honza/vim-snippets"
NeoBundle "scrooloose/nerdtree.git"
NeoBundle "kien/ctrlp.vim"
NeoBundle "rking/ag.vim"
NeoBundle "vim-scripts/IndexedSearch"
NeoBundle "coderifous/textobj-word-column.vim"
NeoBundle "kana/vim-textobj-datetime"
NeoBundle "kana/vim-textobj-entire"
NeoBundle "kana/vim-textobj-function"
NeoBundle "kana/vim-textobj-user"
NeoBundle "thinca/vim-textobj-function-javascript"
NeoBundle "vim-scripts/argtextobj.vim"
NeoBundle "tpope/vim-abolish"
NeoBundle "tpope/vim-endwise.git"
NeoBundle "tpope/vim-ragtag"
NeoBundle "tpope/vim-repeat.git"
NeoBundle "tpope/vim-surround.git"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "tpope/vim-dispatch"
NeoBundle "Raimondi/delimitMate"
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Valloric/YouCompleteMe', {
 \ 'build'      : {
    \ 'mac'     : './install.sh --clang-completer --system-libclang',
    \ 'unix'    : './install.sh --clang-completer --system-libclang',
    \ 'windows' : './install.sh --clang-completer --system-libclang',
    \ 'cygwin'  : './install.sh --clang-completer --system-libclang'
    \ }
 \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'bling/vim-airline'
NeoBundle 'moll/vim-node'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Use the Solarized Dark theme
set background=dark
colorscheme solarized

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

"Perofrmance tweeks
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=256
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

" hilight search
hi Search cterm=none ctermbg=4 ctermfg=15
set hlsearch
set incsearch

" Set leaders
let mapleader = '-'
let maplocalleader = '_'

"tabcompleation
set wildmode=longest,list

"Tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"search
set ignorecase
set smartcase

"autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

"html and sql hilight in php files
let php_sql_query=1
let php_htmlInStrings=1

" php-specifc junk
let g:phpcomplete_index_composer_command="composer"
let g:phpcomplete_index_composer_command="composer"
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_phpcs_conf="--standard=PSR2"

let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_auto_trigger = 0

"commandremap
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"normal remap
noremap gD <c-]>
noremap ' `
noremap ` '

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" edit vimrc
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>sv :e ~/.vimrc<cr>

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
hi clear SignColumn

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

set noswapfile

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Python
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
