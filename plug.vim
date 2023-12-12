call plug#begin('~/.vim/plugged')

" windows resizing 
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

Plug 'mhinz/vim-startify'

"tmux
Plug 'christoomey/vim-tmux-navigator'
" Plug 'lyokha/vim-xkbswitch'

" 主题
Plug 'rafi/awesome-vim-colorschemes'

" 友好的移动
Plug 'yuttie/comfortable-motion.vim'

" 快捷键
" Plug 'liuchengxu/vim-which-key'
" 编辑相
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


"左边栏: NerdTree; 右边栏: Tagbar
"下边栏: Airline
" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 搜索文件内容
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'

" change root dir
Plug 'dbakker/vim-projectroot'
"Plug 'airblade/vim-rooter'

" For git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"For golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'scrooloose/syntastic'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'octol/vim-cpp-enhanced-highlight'

"folder
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim'
Plug 'tmux-plugins/vim-tmux'
"Plug 'davidhalter/jedi-vim'

"自动补全
"
" Optional:
Plug 'ervandew/supertab'

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" code format
Plug 'vim-autoformat/vim-autoformat'

" Plug 'lambdalisue/vim-pyenv'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

call plug#end()


