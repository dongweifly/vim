" colorscheme nord
" colorscheme space-vim-dark
" colorscheme OceanicNext
" colorscheme focuspoint 
" colorscheme flattened_dark
" colorscheme deus
" colorscheme sonakai
" colorscheme hybrid_material
" colorscheme carbonized-dark
" colorscheme seoul256

" colorscheme seoul256-light
" colorscheme carbonized-light
" colorscheme flattened_light


" 定义一个函数，用于从一个列表中随机选择一个元素
function! RandomChoice(list)
    " 获取列表的长度
    let len = len(a:list)
    " 生成一个随机数，范围是 0 到 len - 1
    let index = rand() % len
    " 返回列表中对应的元素
    return a:list[index]
endfunction

" 定义一个函数，用于根据终端的主题设置 vim 的配色方案
function! SetRandomColorscheme()
    " 定义暗色主题的配色方案列表
    let dark_colorschemes = [
                \'nord', 
                \'space-vim-dark', 
                \'OceanicNext', 
                \'flattened_dark', 
                \'hybrid_material']

    " 定义亮色主题的配色方案列表
    let light_colorschemes = [
                \'carbonized-light', 
                \'flattened_light']
    " 如果终端的主题是暗色，从暗色主题的配色方案列表中随机选择一个
    "
    "if &background ==# 'dark'
    ""if terminal_theme == 'dark'
        "let colorscheme = RandomChoice(dark_colorschemes)
    "" 如果终端的主题是亮色，从亮色主题的配色方案列表中随机选择一个
    "else
        "let colorscheme = RandomChoice(light_colorschemes)
    "endif

    "let colorscheme = 'OceanicNext'
    let colorscheme = 'space-vim-dark'
    " 执行 colorscheme 命令，设置 vim 的配色方案
    execute 'colorscheme' colorscheme

endfunction

" 在 vim 启动时，调用 SetRandomColorscheme 函数
autocmd VimEnter * call SetRandomColorscheme()

