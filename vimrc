" 启动文件类型检测
filetype plugin indent on

let mapleader = ","
let g:maplocalleader = ';'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to rememberk
set history=5000

" 粘贴的带注释会导致一堆的格式问题
set paste

"自动设置当前编辑文件所在目录为当前工作路径
"这个东西是否跟其他的有冲突，待验证
set autochdir

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

"默认键位的映射

" Run .vimrc
nnoremap <Leader>r :source $MYVIMRC<CR>

" Write buffer (save)保存
noremap <Leader>w :w<CR>
nnoremap <Leader>q <esc>:q<CR>
nnoremap <Leader><leader>q <esc>:wq<CR>

"插入模式下快速回到normal模式并且到新行
inoremap <C-O> <Esc>o

nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bd  :bd<CR>

"选择窗口
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"智能行移动
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
"插入模式移动M=alt
"inoremap <M-h> <Left>
"inoremap <M-j> <Down>
"inoremap <M-k> <Up>
"inoremap <M-l> <Right>

nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove

" move lines up or down (command - D)
" nmap <D-j> mz:m+<cr>`z
" nmap <D-k> mz:m-2<cr>`z
" vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
" Tab move lines left or right (c-Ctrl,s-Shift)
nmap    <c-tab>     v>
nmap    <s-tab>     v<
vmap    <c-tab>     >gv
vmap    <s-tab>     <gv

" tab navigation like zsh
:nmap <leader>h :tabprevious<CR>
:nmap <leader>l :tabnext<CR>

" settings for resize splitted window
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>


" <leader>z 临时放大/还原当前最大窗口 
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>

call plug#begin('~/.vim/plugged')

" windows resizing 
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" 启动页面
Plug 'mhinz/vim-startify'

"tmux
Plug 'christoomey/vim-tmux-navigator'
" Plug 'lyokha/vim-xkbswitch'


" 主题
Plug 'liuchengxu/space-vim-dark'
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
" Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 搜索文件内容
Plug 'rking/ag.vim'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" code format
Plug 'vim-autoformat/vim-autoformat'

" Plug 'lambdalisue/vim-pyenv'

call plug#end()


" Plugin key settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Windows resizing with Animation
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startify 
let g:startify_list_order = [
            \ ['   These are my bookmarks:'],
            \ 'bookmarks',
            \ ['   My most recently used files'],
            \ 'files',
            \ ['   My most recently used files in the current directory:'],
            \ 'dir',
            \ ['   These are my sessions:'],
            \ 'sessions',
            \]


let g:startify_bookmarks = []

map <F2> :Startify<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC 相关的配置

let g:coc_extension_root = '~/.vim/coc-extensions'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comfortable-motion.vim
"
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  格式化python代码
" 依赖外部命令，需要安装下面两个工具；
" pip install autopep8
" pip install pycodestyle
" autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"jedi-vim - awesome Python autocompletion with VIM
" 不使用这个插件的自动补全，只使用它的其他功能
let g:jedi#completions_enabled = 0

" 默认的一些配置, 如果要修改，修改下面的；
" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>99999999r"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdCommenter 
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack用ag来搜索

" vim-project-root 
if  exists('loaded_projectroot')
    let g:rootmarkers = ['.idea', '.projectroot', '.git', '.hg', '.svn', '.bzr', '_darcs', 'build.xml']
endif

" 设置ag从当前文件所猜测的工程中的rootdir中开始搜索
" let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'ag --nogroup --nocolor --column'

" 利用ProjectRootExe可以设置大量在ProjectRoot下面才能运行的key
" 设置Ack搜索的Keymap
nnoremap <Leader>f :ProjectRootExe Ack<space>-i<space>

nnoremap <leader>t :ProjectRootExe terminal<CR>

" nnoremap <leader>g :ProjectRootExe ! git pull
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  解决snnip和YCM冲突的问题
" function! g:UltiSnips_Complete()
"   call UltiSnips#ExpandSnippet()
"   if g:ulti_expand_res == 0
"     if pumvisible()
"       return "\<C-n>"
"     else
"       call UltiSnips#JumpForwards()
"       if g:ulti_jump_forwards_res == 0
"         return "\<TAB>"
"       endif
"     endif
"   endif
"   return ""
" endfunction
"
" function! g:UltiSnips_Reverse()
"   call UltiSnips#JumpBackwards()
"   if g:ulti_jump_backwards_res == 0
"     return "\<C-P>"
"   endif
"
"   return ""
" endfunction
"
"
" if !exists("g:UltiSnipsJumpForwardTrigger")
"   let g:UltiSnipsJumpForwardTrigger = "<tab>"
" endif
"
" if !exists("g:UltiSnipsJumpBackwardTrigger")
"   let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" endif
"
" au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
" au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  方案2：加上下面的配置后你，完全用tab就是好使的
"" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-syntax
"
" let python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('denite.nvim')
        nnoremap <silent><localLeader>s :call denite#start([{'name': 'grep', 'args': ['', '', '!']}])<cr>
        "buffer列表
        nnoremap  <silent><localleader>b :Denite buffer<CR>
        " 最近使用文件列表
        nnoremap <silent><localleader>o :Denite file_old -winheight=10 -vertical-preview -auto-preview<CR>
        " 当前目录
        nnoremap <silent><localleader>r :Denite file_rec -default-action=vsplit<CR>
        "Denite line
        nnoremap  <silent><localLeader>l :<C-u>Denite line -auto-preview<CR>
        nnoremap <silent><localLeader>w :<C-u>DeniteWithCursorWord line<CR>"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if exists('fzf.vim')
"    nnoremap <silent> <leader>f :call Fzf_dev()<CR>
"    nnoremap <silent> <leader>r :Rg<CR>
"endif

"fzf, ag, fg相关的内容
"使用rg搜索; rg主要是用来做文件搜索;
"有预览功能

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, 
\ <bang> 0 ? fzf#vim#with_preview('up:60')
\          : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

" nnoremap <slient> <leader><leader>g :Rg<CR>

nmap <C-p> :ProjectRootExe Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree 
" nnoremap <leader>e :NERDTreeToggle <CR>

" nnoremap <leader>e :NERDTreeVCS <CR>
" nnoremap <leader>e :NERDTreeVCS %<CR>
nmap <leader>e <Cmd>CocCommand explorer<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd  FileType go
                  \   nmap <Leader>goi <Plug>(go-info)
                  \ | nmap <Leader>god <Plug>(go-doc)
                  \ | nmap <leader>gor <Plug>(go-run)
                  \ | nmap <leader>gob <Plug>(go-build)
                  \ | nmap <leader>got <Plug>(go-test)
                  \ | nmap <leader>goc <Plug>(go-coverage)
                  \ | nmap <Leader>gdv <Plug>(go-def-vertical)
                  \ | nmap <Leader>gr  <Plug>(go-rename)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <localleader>g :TagbarToggle<CR>
" 鼠标在名字上自动预览；或者p也可以实现预览;
" let g:tagbar_autopreview = 1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('ale')
        "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
        nmap [a <Plug>(ale_next_wrap)
        nmap ]a <Plug>(ale_previous_wrap)
        "<Leader>s触发/关闭语法检查
        nmap <Leader>s :ALEToggle<CR>
        "<Leader>d查看错误或警告的详细信息
        nmap <Leader>d :ALEDetail<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if exists('vim-which-key')
   "      nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
   "      nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
   "      nnoremap <silent>[              :<c-u>WhichKey  '['<CR>
   "      nnoremap <silent>]              :<c-u>WhichKey  ']'<CR>
" endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ariline 插件显示git分支
let g:airline#extensions#branch#enabled = 1
" colorscheme space-vim-dark
" 
" "hi Comment cterm=italic
" set termguicolors
" hi LineNr ctermbg=NONE guibg=NONE
" let g:space_vim_dark_background = 234
" 
"
syntax enable

"根据主题的背景色来调整主题
" if &background ==# 'dark'
"    colorscheme space_vim_theme
" else
"     colorscheme solarized
" endif

" --------------- space-vim-theme 
" set background=dark

" if($program != "vscode")
"     colorscheme space_vim_theme
" endif

colorscheme space-vim-dark

" --------------- Ocean
  " let g:oceanic_next_terminal_bold = 1
  " let g:oceanic_next_terminal_italic = 1
  " colorscheme OceanicNext

" -------------- PaperColor
" set background=light
" colorscheme PaperColor

" set background=dark
" colorscheme PaperColor
"
" --------------- pencil 
" colorscheme pencil
" set background=light
" set background=dark

" --------------- solarized 
" set background=dark
" colorscheme solarized
" set termguicolors
" let g:solarized_termcolors=16
" let g:solarized_background=234

" --------------- 分割符
set fillchars=vert:\|,fold:-,diff:-
hi VertSplit ctermbg=NONE  guifg=#075554 guibg=NONE

" -------------- 没字符下的背景色 
hi NonText guifg=bg

set pythonthreedll=libpython3.9.dylib
