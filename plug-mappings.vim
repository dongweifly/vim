" Plugin key settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows resizing with Animation
nnoremap <silent> <Up>    :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(-10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(10)<CR>

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

function! NERDTreeToggleSmart()
    "echo "NERDTreeToggleSmart is called"
    "for [Key, Value] in items(g:NERDTreeOpener)
        "echo Value
    "endfor

    if !g:NERDTree.IsOpen()
        let cwd = getcwd()
        let filedir = expand("%:p:h")
        "echo "cwd is " . cwd
        "echo "filedir is " . filedir
        if stridx(filedir, cwd) == 0
            "echo "NERDTreeFind is executed"
            NERDTreeFind
        else
            "echo "NERDTree is executed"
            NERDTree
        endif
    else
        "echo "NERDTreeClose is executed"
        NERDTreeClose
    endif
endfunction

map <leader>e :call NERDTreeToggleSmart()<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>

"nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" 设置 NERDTree 窗口的宽度为 n 列
let g:NERDTreeWinSize=7


" 在打开 nerdtree 时自动展开当前文件所在的目录
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comfortable-motion.vim
"
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" ProjectRoot 查找目录
let g:rootmarkers = ['.projectroot','.git','.vscode', '.idea', '.hg','.svn','.bzr','_darcs','build.xml']


set wildignore+=/build/,/node_modules/

" 设置ag从当前文件所猜测的工程中的rootdir中开始搜索
" let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'ag --nogroup --nocolor --column'

" 利用ProjectRootExe可以设置大量在ProjectRoot下面才能运行的key
" 设置Ack搜索的Keymap
nnoremap <Leader>f :ProjectRootExe Ack<space>-i<space><cword><CR>
nnoremap <LocalLeader>f :ProjectRootExe Ack<space>-i<space>
nnoremap <LocalLeader>d :ProjectRootCD<CR>

nnoremap <C-p> :Files<CR>
"nnoremap <C-[> :Buffers<CR>
nnoremap <C-]> :History<CR> 

nnoremap <LocalLeader>r :ClangFormat<CR> 
vnoremap <LocalLeader>r :ClangFormat<CR> 

" Open terminal at ProjectRootExe Dir
nnoremap <leader>t :ProjectRootExe terminal<CR>
" Close teminal tnoremap <Leader>t <c-\><c-n>:q!<CR><C-w><C-w>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:fzf_layout = {'window': 'enew'}

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

function! s:VSplitWithFile(file) abort
  execute "vsplit" . shellescape(a:file)
  execute "wincmd l"
  execute "normal <c-w>="
endfunction

" TODO: 怎么映射成上面的函数调用
let g:fzf_action = {
  \ 'ctrl-e': 'edit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


nnoremap <Leader>fm :FZFMru<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <localleader>g :TagbarToggle<CR>

" 鼠标在名字上自动预览；或者p也可以实现预览;
" let g:tagbar_autopreview = 1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_width=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable default mappings
let g:EasyMotion_do_mapping = 0 

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap s <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在Linux Server下面Copy到剪切板的问题
"if  exists('vim-oscyank')

     "nmap <leader>yy <leader>y_
     "vmap <leader>y <Plug>OSCYankVisual
     nmap <LocalLeader>c <Plug>OSCYankOperator
     nmap <LocalLeader>cc <LocalLeader>c_
     vmap <LocalLeader>c <Plug>OSCYankVisual
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++ for clangd
" coc.nvim configuration for clangd
let g:coc_global_extensions = ['coc-clangd']

"coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Git 
nnoremap <silent>gl :Git blame<CR>

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
nnoremap <Leader> mk <Plug>MarkdownPreview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go support
let g:go_gopls_enabled = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"let g:go_debug = ['lsp']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

