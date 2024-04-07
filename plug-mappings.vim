" Plugin key settings

" Window Resizing with Animation - Key mappings for animating window resizing
nnoremap <silent> <Up>    :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(-10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(10)<CR>

" Startify Plugin - Configuration for the Startify Vim plugin
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

" NERDTree Plugin - Smart toggle function and key mappings for NERDTree
function! NERDTreeToggleSmart()
    " Function body here...
endfunction
map <leader>e :call NERDTreeToggleSmart()<cr>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeWinSize=7

" Comfortable Motion Plugin - Settings for smooth scrolling in Vim
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Project Root Configuration - Settings for identifying the project root directory
let g:rootmarkers = ['.projectroot','.git','.vscode', '.idea', '.hg','.svn','.bzr','_darcs','build.xml']
set wildignore+=/build/,/node_modules/target/

" Search Tools Configuration - Settings for the silver searcher 'ag' command
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <Leader>f :ProjectRootExe Ack<space>-i<space><cword><CR>
nnoremap <LocalLeader>f :ProjectRootExe Ack<space>-i<space>
nnoremap <LocalLeader>d :ProjectRootCD<CR>

" FZF Key Mappings - Key mappings for fuzzy file searching
nnoremap <C-p> :Files<CR>
"nnoremap <C-[> :Buffers<CR>
nnoremap <C-]> :History<CR> 

" ClangFormat Mappings - Auto commands for formatting supported file types with ClangFormat
augroup ClangFormatMappings
  autocmd!
  autocmd FileType c,cpp,java,javascript,json nnoremap <buffer> <LocalLeader>r :ClangFormat<CR>
  autocmd FileType c,cpp,java,javascript,json vnoremap <buffer> <LocalLeader>r :ClangFormat<CR>
augroup END

" RustFmt Mappings - Auto commands for formatting Rust files with RustFmt
augroup RustFmt
  autocmd!
  autocmd FileType rust nnoremap <buffer> <LocalLeader>r :RustFmt<CR>
  autocmd FileType rust vnoremap <buffer> <LocalLeader>r :RustFmt<CR>
augroup END

" Terminal Key Mappings - Key mappings for opening and closing the terminal
nnoremap <leader>t :ProjectRootExe terminal<CR>
tnoremap <Leader>t <c-\><c-n>:q!<CR><C-w><C-w>

" FZF MRU Command - Custom command for most recently used files with preview
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

" FZF Action Settings - Configuration for actions when selecting files with FZF
let g:fzf_action = {
  \ 'ctrl-e': 'edit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" FZF MRU Key Mapping - Key mapping for invoking the FZF MRU command
nnoremap <Leader>fm :FZFMru<CR>



" Tagbar Plugin - Key mapping to toggle Tagbar and settings for auto focus, auto close, and width
nnoremap <localleader>g :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_width=20

" EasyMotion Plugin - Disable default mappings and set custom key bindings for motion
let g:EasyMotion_do_mapping = 0 
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" OSCYank Plugin - Key mappings for copying to clipboard on Linux servers
nmap <LocalLeader>c <Plug>OSCYankOperator
nmap <LocalLeader>cc <LocalLeader>c_
vmap <LocalLeader>c <Plug>OSCYankVisual

" CoC (Conquer of Completion) Plugin - Configuration for clangd and key mappings for code navigation
let g:coc_global_extensions = ['coc-clangd']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Git Integration - Key mapping for Git blame
nnoremap <silent>gl :Git blame<CR>

" Markdown Preview - Key mapping for Markdown preview
nnoremap <Leader> mk <Plug>MarkdownPreview

" Go Language Support - Settings for Go language server protocol (gopls)
let g:go_gopls_enabled = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

