let g:mapleader = "\<Space"         " Set leader key
let g:indent_blankline_enabled = 0
cmap w!! w !sudo tee %
set mouse=a                         " Enable mouse
set clipboard=unnamedplus           " Copy paste between vim & everything else
let g:asmsyntax = 'nasm'            " NASM syntax

set wrap                            " Display long lines on two lines
set linebreak                       " Wrap at end of word
set tabstop=4                       " 4 spaces for a tab
set shiftwidth=4                    " Number of space chars inserted for indentation
set smarttab                        " Realize tap width
set expandtab                       " Convert tabs to spaces
set smartindent                     " Smart Indent
set autoindent                      " Auto Indent
set formatoptions=cro               " Stop newline continuation of comments
set pumheight=10                    " Smaller pop-ups
set cmdheight=2                     " Larger area to display messages
set splitbelow                      " Horizontal Split will automatically be below
set splitright                      " Vertical splits will automatically be to the right
set ruler                           " Always show cursor position
set number                          " Line numbers
set number relativenumber           " Cursor position relative to line
set autochdir                       " Working dir will always be the same as your current working dir
set encoding=utf-8                  " Encoding displayed
set fileencoding=utf-8              " Encoding witten to file
set updatetime=300                  " Faster completion
set timeoutlen=500                  " Default timeoutlen is 1000ms
set iskeyword+=-                    " Treat dash separated words as a word text object
set conceallevel=0                  " To see `` in markdown files
set laststatus=0                    " Always display status line
set showtabline=4                   " Always show tabs
set noshowmode                      " Remove -- INSERT -- NORMAL -- VISUAL
set background=dark                 " Tell vim the background

au! BufWritePost $MYVIMRC source %  " Auto source when writing to init.vim / Alternatively you can run :source $MYVIMRC

" Indentation
lua << EOF
vim.opt.list = true

require("indent_blankline").setup {
    show_end_of_line = true,
}
EOF

" Bufferline
lua << EOF
require("bufferline").setup{
options = {
  separator_style = "thin"
  }
}
EOF
