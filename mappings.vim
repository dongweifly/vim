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

