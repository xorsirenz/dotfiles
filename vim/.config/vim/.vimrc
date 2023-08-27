" global defaults
set nocompatible

filetype on
filetype plugin indent on
"=================================
" custom configs
"=================================
":so $VIMRUNTIME/syntax/hitest.vim
syntax enable
colorscheme default
" syntax highlighting
highlight Comment ctermfg=DarkCyan
highlight Constant ctermfg=LightCyan
highlight Special ctermfg=Magenta
highlight Identifier ctermfg=Green
highlight Statement ctermfg=DarkMagenta
highlight PreProc ctermfg=LightBlue
highlight Type ctermfg=LightCyan

" highlighting
highlight LineNr ctermfg=LightCyan
highlight CursorLineNr ctermfg=White
highlight Search ctermfg=Cyan
highlight SpellBad ctermfg=Cyan

" use line numbers in relative
set number relativenumber 

" set tabs and spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" set indent
set autoindent
set smartindent

" use 256 colors
set t_Co=256 

" set list
set list

" set mouse=a # Allows mouse support

set ruler
" set cursorline
set wrapmargin=8
set encoding=utf-8

" use sysetm clipboard
set clipboard+=unnamedplus

" enable autocomplete:
set wildmode=longest,list,full

" remoce trailing whitespce on save
"autocmd BufWritePre * %s/\s\+$//e

set nolist
map <F6> :setlocal spell! spelllang=en_us<CR>
