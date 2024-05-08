" Begin plugin section
call plug#begin('~/.vim/plugged')

" Window management plugins
Plug 'camspiers/animate.vim' " Animate window resizing
Plug 'camspiers/lens.vim' " Auto-resize windows

" User interface enhancements
Plug 'mhinz/vim-startify' " Startup page
Plug 'yuttie/comfortable-motion.vim' " Smooth scrolling
Plug 'vim-airline/vim-airline' " Status/tabline
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'liuchengxu/space-vim-dark'

" Navigation and search tools
Plug 'christoomey/vim-tmux-navigator' " Tmux integration
Plug 'preservim/nerdtree' " File explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax highlight for NERDTree
Plug 'majutsushi/tagbar' " Code structure display
Plug 'easymotion/vim-easymotion' " Motion plugin
Plug 'rking/ag.vim' " Use ag for searching
Plug 'mileszs/ack.vim' " Use ack for searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim' " FZF integration for Vim
Plug 'pbogut/fzf-mru.vim' " FZF most recently used files

" Editing enhancements
Plug 'terryma/vim-multiple-cursors' " Multiple cursors
Plug 'scrooloose/nerdcommenter' " Commenting utility
Plug 'tpope/vim-surround' " Surround text with characters
Plug 'tpope/vim-repeat' " Repeat plugin commands with "."

" Language support and syntax
Plug 'rust-lang/rust.vim' " Rust language support
Plug 'godlygeek/tabular' " Markdown table formatting
Plug 'plasticboy/vim-markdown' " Markdown editing
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Markdown preview
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go language support
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'octol/vim-cpp-enhanced-highlight' " Enhanced C++ syntax highlighting

" Code management
Plug 'dbakker/vim-projectroot' " Project root management
Plug 'Konfekt/FastFold' " Fast code folding
Plug 'tmhedberg/SimpylFold' " Python code folding
Plug 'neoclide/coc.nvim' " Autocompletion and LSP

" Version control
Plug 'tpope/vim-fugitive' " Git integration
Plug 'zivyangll/git-blame.vim' " Git blame annotation

" Code formatting
Plug 'vim-autoformat/vim-autoformat' " Autoformatting
Plug 'rhysd/vim-clang-format' " Clang format integration

" Clipboard integration
Plug 'ojroques/vim-oscyank', {'branch': 'main'} " Share clipboard

" End plugin section
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Scheme and Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Function to randomly choose a color scheme
function! RandomChoice(list)
    let len = len(a:list)
    let index = rand() % len
    return a:list[index]
endfunction

" Function to set a random color scheme based on terminal theme
function! SetRandomColorscheme()
    let dark_colorschemes = ['nord', 'space-vim-dark', 'OceanicNext', 'flattened_dark', 'hybrid_material']
    let light_colorschemes = ['carbonized-light', 'flattened_light']
    let colorscheme = 'space-vim-dark'
    execute 'colorscheme' colorscheme
endfunction

" Apply random color scheme on Vim start
"autocmd VimEnter * call SetRandomColorscheme()
colorscheme space-vim-dark
"colorscheme darkblue

hi Comment cterm=italic

" If you want to make the backgound transparent, override the related items in
" your vimrc. from : https://github.com/liuchengxu/space-vim-dark
" USE TERMINAL BACKGROUND

"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE

" If you prefer the grey comment:
hi Comment guifg=#5C6370 ctermfg=59

" Vim Script
let g:airline_theme='violet'

" Vim Script
let g:lightline = {'colorscheme': 'violet'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Up>    :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(-10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(10)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startup Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_list_order = ['bookmarks', 'files', 'dir', 'sessions']
let g:startify_bookmarks = []
map <F2> :Startify<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File Explorer Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NERDTreeToggleSmart()
    " Function body here...
endfunction
map <leader>e :call NERDTreeToggleSmart()<cr>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeWinSize=7

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Scrolling Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Project and Search Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rootmarkers = ['.projectroot','.git','.jscode', '.idea', '.hg','.svn','.bzr','_darcs','build.xml']
set wildignore+=/build/,/node_modules/target/
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <Leader>f :ProjectRootExe Ack<space>-i<space><cword><CR>
nnoremap <LocalLeader>f :ProjectRootExe Ack<space>-i<space>
nnoremap <LocalLeader>d :ProjectRootCD<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-]> :History<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code Formatting and Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ClangFormatMappings
  autocmd!
  autocmd FileType c,cpp,java,javascript,json nnoremap <buffer> <LocalLeader>r :ClangFormat<CR>
  autocmd FileType c,cpp,java,javascript,json vnoremap <buffer> <LocalLeader>r :ClangFormat<CR>
augroup END
augroup RustFmt
  autocmd!
  autocmd FileType rust nnoremap <buffer> <LocalLeader>r :RustFmt<CR>
  autocmd FileType rust vnoremap <buffer> <LocalLeader>r :RustFmt<CR>
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminal and Shell Integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :ProjectRootExe terminal<CR>
tnoremap <Leader>t <c-\><c-n>:q!<CR><C-w><C-w>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fuzzy Finder and MRU
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -bang -nargs=? FZFMru call fzf_mru#actions#mru(<q-args>,
    \{
    \'window': {'width': 0.9, 'height': 0.8},
        \'options': [
            \'--preview', 'cat {}',
            \'--preview-window', 'right:50%',
            \'--bind', 'ctrl-_:toggle-preview'
        \]
    \}
\)
let g:fzf_action = {
  \ 'ctrl-e': 'edit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <Leader>fm :FZFMru<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar and Code Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <localleader>g :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_width=20
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f;
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clipboard and External Command Integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <LocalLeader>c <Plug>OSCYankOperator
nmap <LocalLeader>cc <LocalLeader>c_
vmap <LocalLeader>c <Plug>OSCYankVisual

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocompletion and Language Server Protocol
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More configure : https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim
let g:coc_global_extensions = ['coc-clangd']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Version Control System Integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent>gl :Git blame<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown and Documentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader> mk <Plug>MarkdownPreview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_gopls_enabled = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

