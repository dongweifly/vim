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
" 这个东西打开会会导致COC的提示有问题
" set paste

"自动设置当前编辑文件所在目录为当前工作路径
"这个东西是否跟其他的有冲突，待验证
" set autochdir

" 自动切换到某一个工作目录中
" exec 'cd ' . fnameescape('/tmp')

syntax enable

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

"在任意地方可以使用鼠标
set mouse=a

" 缩进
set expandtab                   " tab=空格
set tabstop=4                   " tab缩进4个空格
set shiftwidth=4                " 自动缩进空格数
set softtabstop=4               " 退格删除缩进
set backspace=indent,start      " 退格可删除缩进和原有字符
set autoindent                  " 与前一行同样等级缩进

" 搜索相关
set showmatch                   " 短暂回显匹配括号
set hlsearch                    " 检索时高亮显示匹配项
set incsearch                   " 边输入边搜索
set ignorecase                  " 搜索忽略大小写
set smartcase                   " 智能大小写搜索
set smarttab

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


" vim和系统共享剪切板, 连接上的远程vim中的内容可能不好使；
" 在vim中使用y,p; 在系统中使用<M-C> <M-V>二者是等价的；
" 但是不能在vim中使用<M-C> <M-V>
" VIM中设置set mouse=a的情况，支持使用鼠标选中，然后用y复制；
set clipboard=unnamed

" 使用快速滚动, 对用户体验的影响还比较大
set ttyfast

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码相关
set encoding=utf-8     
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"选择窗口
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"智能行移动, 不会自动跳过这行；
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" plug 
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
" C++ 语法高亮
Plug 'bfrg/vim-cpp-modern'

" 编程语言支持
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tmux-plugins/vim-tmux'

"自动补全
"
" Optional:
Plug 'ervandew/supertab'

"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'ironcamel/vim-script-runner'

" code format
Plug 'vim-autoformat/vim-autoformat'

" Plug 'lambdalisue/vim-pyenv'

call plug#end()


" Plugin key settings

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

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comfortable-motion.vim
"
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

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
nnoremap <localleader>g :TagbarToggle<CR>
" 鼠标在名字上自动预览；或者p也可以实现预览;
" let g:tagbar_autopreview = 1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1 

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

