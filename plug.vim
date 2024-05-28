" Begin plugin section
call plug#begin('~/.vim/plugged')

" Window management plugins
Plug 'camspiers/animate.vim' " Animate window resizing
Plug 'camspiers/lens.vim' " Auto-resize windows

" User interface enhancements
Plug 'mhinz/vim-startify' " Startup page
Plug 'vim-airline/vim-airline' " Status/tabline
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'liuchengxu/space-vim-dark'
Plug 'altercation/vim-colors-solarized'

" Navigation and search tools
Plug 'christoomey/vim-tmux-navigator' " Tmux integration
Plug 'preservim/nerdtree' " File explorer
Plug 'MattesGroeger/vim-bookmarks'
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
"colorscheme space-vim-dark

" 定义一个函数来设置主题
function! SetTheme(theme, airline_theme, lightline_theme)
    execute 'colorscheme ' . a:theme
    let g:airline_theme=a:airline_theme
    let g:lightline = {'colorscheme': a:lightline_theme}
    if a:theme == 'space-vim-dark'
        hi Comment guifg=#5C6370 ctermfg=59
    endif
endfunction


if exists('$ITERM_PROFILE')
    if match($ITERM_PROFILE, 'dark') != -1
        call SetTheme('space-vim-dark', 'violet', 'violet')
    else
        call SetTheme('solarized', 'solarized', 'solarized')
        let g:solarized_termcolors=256
        let g:solarized_italic=1
    endif
else
    call SetTheme('space-vim-dark', 'violet', 'violet')
endif
"colorscheme darkblue


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
" TODO: NERDTree Config


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

" EasyMotion mappings
" Jump to any character forward
map f <Plug>(easymotion-overwin-f)       
" Jump to any character forward (shorter version)
map ff <Plug>(easymotion-s)
" Jump to the start of a word forward
map fs <Plug>(easymotion-f) 
" Jump to the start of a line forward
map fl <Plug>(easymotion-lineforward)   
" Jump to any line downward
map fj <Plug>(easymotion-j)           
" Jump to any line upward
map fk <Plug>(easymotion-k)  
" Jump to the start of a line backward
map fh <Plug>(easymotion-linebackward) 


let g:EasyMotion_smartcase = 1


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


" Function to check if the cursor is after a whitespace or at the start of the line
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
         
" Use the Tab key to navigate through CoC autocompletion options. 
" The Tab key also functions as a regular tab insertion when 
" there is no autocompletion suggestion or after a whitespace character.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ "\<Tab>"
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

