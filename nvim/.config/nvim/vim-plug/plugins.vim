" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " File Tree
    Plug 'kyazdani42/nvim-tree.lua'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'othree/html5.vim'
    Plug 'antoinemadec/coc-fzf'
    
    " LuaLine Status Bar
    Plug 'nvim-lualine/lualine.nvim'
    
    " Git
    Plug 'tpope/vim-fugitive'
    
    " Themes
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'psliwka/termcolors.nvim'


call plug#end()
