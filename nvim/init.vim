" -------------------------------------
"  Maintainer:
"     Mathieu St-Vincent
" -------------------------------------


" -------------------------------------
"  General settings
" -------------------------------------

set nocompatible
filetype off                  " required
filetype plugin indent on     " required


" -------------------------------------
"  Plugins Settings 
" -------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf'
Plug 'raimondi/delimitmate'
Plug 'quramy/tsuquyomi'



" Languages
" ------------------------

" Html
Plug 'digitaltoad/vim-jade'
Plug 'othree/html5.vim'
" Styling
Plug 'tpope/vim-haml'                 " Haml, Sass, SCSS
Plug 'groenewege/vim-less'
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'
" Javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'isruslan/vim-es6'
Plug 'elzr/vim-json'
Plug 'chase/vim-ansible-yaml'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
" Elm
Plug 'elmcast/elm-vim'
" Markdown
Plug 'suan/vim-instant-markdown'
" Liquid
Plug 'tpope/vim-liquid'
" PHP
Plug 'stanangeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'nelsyeung/twig.vim'


" Color Schemes
" ------------------------
Plug 'MenkeTechnologies/VimColorSchemes'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'cocopon/iceberg.vim'

call plug#end()

" Set NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

" Enable Emmet
let g:user_emmet_mode='a'               "enable all function in all mode.

" JSX enabled in .js files
let g:jsx_ext_required = 0

" Php overriding highlighting
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Enable FZF
set rtp+=/usr/local/opt/fzf


" Enable Python
" let g:python2_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'

" NERDTree show hidden files
let NERDTreeShowHidden=1

" Make TSX files work plez
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript

" Make .twig files work
autocmd BufNewFile,BufRead *.twig set filetype=html.twig

" Make Elm files work plez
autocmd BufNewFile,BufRead *.elm setlocal filetype=elm

" -------------------------------------
"  END Plugins Settings 
" -------------------------------------





" -------------------------------------
"  Appearance settings
" -------------------------------------

syntax enable
set background=dark
set t_Co=256
colorscheme gruvbox


" set true colors and add vim specific fixes
set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum


" -------------------------------------
"  Interface settings
" -------------------------------------

set guifont=OperatorMono-Book:h16
" For italic on operator mono
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic

set mouse=a                             " Activates the mouse
set ruler                               " Show current position
set backspace=indent,eol,start          " Configure workspace so it works as it should
set whichwrap+=<,>,h,l                  
set magic                               " For regular expressions turn magic on
set showmatch                           " Show matching brackets when text indicator is over them
set mat=2                               " How many tenths of a second to blink when matching brackets
set scrolloff=5                         " keep at least 5 lines above/below
set noerrorbells                        " No annoying sound on errors
set novisualbell
set tm=500


" -------------------------------------
"  File & backup settings
" -------------------------------------

set autoread                            " update file when changed outside of vim
set autoindent                          " copy indentation from the previous line for new line
set history=200                         " store last 200 commands as history
set nobackup                            " don't save backups
set noerrorbells                        " no error bells please
set noswapfile                          " no swapfiles
set nowritebackup                       " don't save a backup while editing
set lazyredraw                          " see if this fixes the slowness
set ttyfast                             " indicates a fast terminal connection
set undodir=~/.vim/undodir              " set undofile location
set undofile                            " maintain undo history between sessions
set undolevels=1000                     " store 1000 undos


" -------------------------------------
"  Text settings
" -------------------------------------

set nowrap                              " don't wrap my text !

" Use spaces, damn it!
set expandtab                           " use tabs instead of spaces
set nojoinspaces                        " use one space, not two, after punctuation
set shiftround                          " shift to next tabstop
set shiftwidth=4                        " amount of space used for indentation
set softtabstop=4                       " appearance of tabs
set tabstop=4                           " use two spaces for tabs

" Text options
set formatoptions-=cro                  " prevent next line comments

" searching
set hlsearch                            " highlight search matches
set ignorecase                          " set case insensitive searching
set incsearch                           " find as you type search
set smartcase                           " case sensitive searching when not all lowercase

" character encoding
if !&readonly && &modifiable
  set fileencoding=utf-8              " the encoding written to file
endif
set encoding=utf-8                    " the encoding displayed


" -------------------------------------
"  Autocmd Rules
" -------------------------------------

" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END