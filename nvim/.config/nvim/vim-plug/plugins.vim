" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " HTML
    Plug 'mattn/emmet-vim'

    " Tabs
    Plug 'akinsho/bufferline.nvim'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'othree/html5.vim'
    Plug 'antoinemadec/coc-fzf'
   
    " Indentation
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'lukas-reineke/indent-blankline.nvim'

    " LuaLine Status Bar
    Plug 'nvim-lualine/lualine.nvim'

    " Git
    Plug 'tpope/vim-fugitive'

    " Markdown preview
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

    " Themes
    Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
