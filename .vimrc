" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

""  Custom plugins goes here ""

Bundle "chrisbra/color_highlight.git"
Bundle "skwp/vim-colors-solarized"
Bundle "itchyny/lightline.vim"
Bundle "jby/tmux.vim.git"
Bundle "morhetz/gruvbox"
Bundle "Xuyuanp/nerdtree-git-plugin"

Bundle "gregsexton/gitv"
Bundle 'airblade/vim-gitgutter'
Bundle "tpope/vim-fugitive"

Bundle "pangloss/vim-javascript"
Bundle "othree/javascript-libraries-syntax.vim"

Bundle "groenewege/vim-less.git"
Bundle "itspriddle/vim-jquery.git"
Bundle "kchmck/vim-coffee-script"
Bundle "scrooloose/syntastic.git"
Bundle "vim-addon-mw-utils"
Bundle "SirVer/ultisnips"
Bundle "skwp/vim-html-escape"
Bundle "honza/vim-snippets"

Bundle "scrooloose/nerdtree.git"
Bundle "kien/ctrlp.vim"

Bundle "rking/ag.vim"
Bundle "vim-scripts/IndexedSearch"
Bundle "nelstrom/vim-visual-star-search"
Bundle "Lokaltog/vim-easymotion"

Bundle "bootleq/vim-textobj-rubysymbol"
Bundle "coderifous/textobj-word-column.vim"
Bundle "kana/vim-textobj-datetime"
Bundle "kana/vim-textobj-entire"
Bundle "kana/vim-textobj-function"
Bundle "kana/vim-textobj-user"
Bundle "lucapette/vim-textobj-underscore"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "thinca/vim-textobj-function-javascript"
Bundle "vim-scripts/argtextobj.vim"

Bundle "tpope/vim-abolish"
Bundle "tpope/vim-endwise.git"
Bundle "tpope/vim-ragtag"
Bundle "tpope/vim-repeat.git"
Bundle "tpope/vim-surround.git"
Bundle "tpope/vim-unimpaired"
Bundle "tpope/vim-dispatch"

Bundle "Raimondi/delimitMate"
Bundle "Valloric/YouCompleteMe"
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
" Bundle "m2mdas/phpcomplete-extended"

Bundle 'othree/html5.vim'

Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'


"" END Plugins ""
call vundle#end()

set autoindent
filetype plugin indent on

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
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
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
" Use relative line numbers
set relativenumber
au BufReadPost * set relativenumber
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
let g:ycm_auto_trigger = 0

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
