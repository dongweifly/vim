function! NewBufferTest()
    new
    setlocal noreadonly
    map<buffer> <silent> q :quit<CR>
    setlocal modifiable
    setlocal nolist
endfunction


call NewBufferTest()
