call plug#begin('~/.vim/plugged')

" 启动页面
Plug 'mhinz/vim-startify'

"tmux
Plug 'christoomey/vim-tmux-navigator'
" Plug 'lyokha/vim-xkbswitch'


" 主题
" Plug 'liuchengxu/space-vim-dark'
Plug 'ericbn/vim-solarized'
Plug 'liuchengxu/space-vim-theme'
Plug 'reedes/vim-colors-pencil'
Plug 'NLKNguyen/papercolor-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'


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
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 搜索文件内容
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'

" change root dir
Plug 'dbakker/vim-projectroot'

" git相关
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" 语法高亮
Plug 'scrooloose/syntastic'

" 编程语言支持
"Plug 'fatih/vim-go'
Plug 'tmux-plugins/vim-tmux'
"Plug 'davidhalter/jedi-vim'

"自动补全
"
" Optional:
Plug 'ervandew/supertab'
"Plug 'Valloric/YouCompleteMe'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'


"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ironcamel/vim-script-runner'

call plug#end()


