"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype detection
filetype plugin indent on

" Set leader keys
let mapleader = ","
let g:maplocalleader = ';'

" Set command history length
set history=5000

" Set compatibility mode off
set nocp

" Disable swap file creation
set noswapfile

" Enable auto-reading of files when changed from the outside
set autoread

" Display line numbers
set number

" Enable mouse support
set mouse=a

" Set folding method based on syntax
set foldmethod=syntax

" Start with all folds open
set foldlevelstart=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Convert tabs to spaces
set expandtab

" Set tab width
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Enable auto-indentation
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight matching brackets
set showmatch

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch

" Ignore case in search patterns
set ignorecase

" Override ignorecase if search pattern contains uppercase letters
set smartcase

" Enable smart tab
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set scroll jump and offset
set scrolljump=3
set scrolloff=1

" Allow hidden buffers
set hidden

" Configure backspace behavior
set backspace=eol,start,indent

" Do not redraw during macros for better performance
set lazyredraw

" Enable extended regular expressions
set magic

" Set match time for bracket blinking
set mat=2

" Disable error bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Encoding Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set encoding for proper display of characters
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => True Color Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable true color support if available
if has("termguicolors")
    set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clipboard and External Command Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Share system clipboard with Vim
set clipboard=unnamed

" Enable fast terminal communication
set ttyfast

" Save cursor position when file is closed
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd BufWritePost * normal! m'
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mapping Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Key mappings for various actions
nnoremap <Leader>r :source $MYVIMRC<CR>
noremap <Leader>w :w<CR>
nnoremap <Leader>q <esc>:q<CR>
nnoremap <Leader><leader>q <esc>:wq<CR>
inoremap <C-O> <Esc>o
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bd  :bd<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove
nmap <c-tab> v>
nmap <s-tab> v<
vmap <c-tab> >gv
vmap <s-tab> <gv
nmap <leader>h :tabprevious<CR>
nmap <leader>l :tabnext<CR>
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>

" Function to zoom in/out the current window
function! Zoom ()
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose
        if l:cur_bufname == bufname('')
            call winrestview(l:cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>

