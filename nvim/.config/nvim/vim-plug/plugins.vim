" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'othree/html5.vim'
    Plug 'antoinemadec/coc-fzf'

    " Git
    Plug 'tpope/vim-fugitive'

    " HTML
    Plug 'mattn/emmet-vim'

    " Indentation
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'lukas-reineke/indent-blankline.nvim'

    " LuaLine Status Bar
    Plug 'nvim-lualine/lualine.nvim'

    " Markdown preview
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

    " Nerd Tree
    Plug 'preservim/nerdtree'

    " Ranger Tree
    Plug 'iberianpig/ranger-explorer.vim'

    " Tabs
    Plug 'akinsho/bufferline.nvim'

    " Themes
    Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
