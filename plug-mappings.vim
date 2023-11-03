" Plugin key settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows resizing with Animation
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>

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
" comfortable-motion.vim
"
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" vim-rooter
let g:rooter_patterns = ['.idea', '.vscode', '.projectroot', '.git', '.hg', '.svn', '.bzr', '_darcs', 'build.xml']
let g:rooter_cd_cmd = 'lcd'
let g:rooter_patterns = ['=project']
let g:rooter_change_directory_for_non_project_files = 1
let g:rooter_silent_chdir = 0


set wildignore+=/build/,/node_modules/

" 设置ag从当前文件所猜测的工程中的rootdir中开始搜索
" let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'ag --nogroup --nocolor --column'

" 利用ProjectRootExe可以设置大量在ProjectRoot下面才能运行的key
" 设置Ack搜索的Keymap
"nnoremap <Leader>f :ProjectRootExe Ack<space>-i<space><cword><CR>
"nnoremap <LocalLeader>f :ProjectRootExe Ack<space>-i<space>

nmap <C-p> :Files<CR>
nmap <C-l> :Buffers<CR>

" Open terminal at ProjectRootExe Dir
nnoremap <leader>t :ProjectRootExe terminal<CR>

" Close teminal 
tnoremap <Leader>t <c-\><c-n>:q!<CR><C-w><C-w>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:fzf_action = {
  \ 'ctrl-e': 'edit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <localleader>g :TagbarToggle<CR>

" 鼠标在名字上自动预览；或者p也可以实现预览;
" let g:tagbar_autopreview = 1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1 

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
if  exists('vim-oscyank')
     nmap <leader>y <Plug>OSCYankOperator
     nmap <leader>yy <leader>y_
     vmap <leader>y <Plug>OSCYankVisual
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python 编程支持, 待补充
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go 编程支持, 待补充
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
