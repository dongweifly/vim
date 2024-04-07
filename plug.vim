call plug#begin('~/.vim/plugged')

" Window Resizing - Plugins to animate and control window resizing
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" Startup Page - Plugin to customize the start page of Vim
Plug 'mhinz/vim-startify'

" Tmux Integration - Plugins for seamless navigation between tmux panes and Vim splits
Plug 'christoomey/vim-tmux-navigator'

" Color Schemes - Plugin to provide a variety of color schemes for Vim
Plug 'rafi/awesome-vim-colorschemes'

" Smooth Scrolling - Plugin to make motion in Vim more comfortable
Plug 'yuttie/comfortable-motion.vim'

" Editing Enhancements - Plugins to enhance text editing capabilities
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Rust Support - Plugin for Rust language support in Vim
Plug 'rust-lang/rust.vim'

" Markdown - Plugins for Markdown formatting and preview
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" File Explorer - Plugins to enhance file navigation within Vim
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Code Navigation - Plugins to assist with navigating through code
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Search Tools - Plugins to search through file contents efficiently
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'

" Project Management - Plugin to change the root directory within Vim
Plug 'dbakker/vim-projectroot'

" Git Integration - Plugins for Git integration and blame annotation
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'

" Go Language Support - Plugin for Go language support in Vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Syntax Checking - Plugin for syntax checking and linting
Plug 'scrooloose/syntastic'

" Syntax Highlighting - Plugin for enhanced C++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Code Folding - Plugins to manage code folding
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

" Autocompletion - Plugin for autocompletion and language server protocol
Plug 'neoclide/coc.nvim'

" Fuzzy Finder - Plugins to enable fuzzy file searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" Code Formatting - Plugins for automatic code formatting
Plug 'vim-autoformat/vim-autoformat'
Plug 'rhysd/vim-clang-format'

" Clipboard Sharing - Plugin to share clipboard between Vim and the system
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

call plug#end()

