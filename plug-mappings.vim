" Plugin key settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Windows resizing with Animation
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
    let g:rootmarkers = ['.idea', '.vscode', '.projectroot', '.git', '.hg', '.svn', '.bzr', '_darcs', 'build.xml']
endif

" 过滤某些不想搜索的文件
let g:projectroot#exclude = ['node_modules', 'build', '.git']

set wildignore+=/build/,/node_modules/
" 设置ag从当前文件所猜测的工程中的rootdir中开始搜索
" let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'ag --nogroup --nocolor --column'

" 利用ProjectRootExe可以设置大量在ProjectRoot下面才能运行的key
" 设置Ack搜索的Keymap
nnoremap <Leader>f :ProjectRootExe Ack<space>-i<space><cword><CR>

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
        nnoremap <silent><localLeader>l :<C-u>Denite line -auto-preview<CR>
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


nmap <leader>y <Plug>OSCYankOperator
nmap <leader>yy <leader>y_
vmap <leader>y <Plug>OSCYankVisual
