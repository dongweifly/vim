"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to rememberk
set history=5000

" 粘贴的带注释会导致一堆的格式问题
" set paste

"自动设置当前编辑文件所在目录为当前工作路径
"这个东西是否跟其他的有冲突，待验证
" set autochdir

" 自动切换到某一个工作目录中
" exec 'cd ' . fnameescape('/tmp')

" 设置不兼容模式
set nocp
" 不产生交换文件
set noswapfile
" 文件改变后自动加载
set autoread

" command W w !sudo tee % > /dev/null
set number
"set relativenumber

" augroup linenumbers
"     autocmd!
"     autocmd BufEnter *    :set relativenumber
"     autocmd BufLeave *    :set number norelativenumber
"     autocmd WinEnter *    :set relativenumber
"     autocmd WinLeave *    :set number norelativenumber
"     autocmd InsertEnter * :set number norelativenumber
"     autocmd InsertLeave * :set relativenumber
"     autocmd FocusLost *   :set number norelativenumber
"     autocmd FocusGained * :set relativenumber
" augroup END

set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缩进
set expandtab                   " tab=空格
set tabstop=4                   " tab缩进4个空格
set shiftwidth=4                " 自动缩进空格数
set softtabstop=4               " 退格删除缩进
set backspace=indent,start      " 退格可删除缩进和原有字符
set autoindent                  " 与前一行同样等级缩进
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索相关
set showmatch                   " 短暂回显匹配括号
set hlsearch                    " 检索时高亮显示匹配项
set incsearch                   " 边输入边搜索
set ignorecase                  " 搜索忽略大小写
set smartcase                   " 智能大小写搜索
set smarttab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolljump=3                " 当光标离开屏幕滑动行数
set scrolloff=1                 " 保持在光标上下最少行数, 最低下能写多少行
set hidden                      " 允许不保存切换buffer

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码相关
set encoding=utf-8              " 编码，使汉语正常显示
set termencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 真彩色
if has("termguicolors")
    let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
    let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
    " enable true color
    set termguicolors
endif

" let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
" ESC后，中英文切换的问题
let g:XkbSiwtchLib='/usr/local/lib/libxkbswitch.dylib'

"适配上面的问题中搜狗输入法的问题
set iminsert=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim和系统共享剪切板, 连接上的远程vim中的内容可能不好使；
" 在vim中使用y,p; 在系统中使用<M-C> <M-V>二者是等价的；
" 但是不能在vim中使用<M-C> <M-V>
" VIM中设置set mouse=a的情况，支持使用鼠标选中，然后用y复制；
set clipboard=unnamed

" 使用快速滚动, 对用户体验的影响还比较大
set ttyfast

set pythonthreehome=/Users/liubo/.pyenv/shims/python3

" 保存光标到上次打开的位置
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd BufWritePost * normal! m'
augroup END


autocmd!   BufNewFile,BufRead *    setlocal nofoldenable

