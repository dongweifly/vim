" colorscheme space-vim-dark
" 
" "hi Comment cterm=italic
" set termguicolors
" hi LineNr ctermbg=NONE guibg=NONE
" let g:space_vim_dark_background = 234
" 
"
syntax enable

"根据主题的背景色来调整主题
" if &background ==# 'dark'
"    colorscheme space_vim_theme
" else
"     colorscheme solarized
" endif

" --------------- space-vim-theme 
" set background=dark
" colorscheme space_vim_theme
colorscheme space-vim-dark

" --------------- Ocean
  " let g:oceanic_next_terminal_bold = 1
  " let g:oceanic_next_terminal_italic = 1
  " colorscheme OceanicNext

" -------------- PaperColor
" set background=light
" colorscheme PaperColor

" set background=dark
" colorscheme PaperColor
"
" --------------- pencil 
" colorscheme pencil
" set background=light
" set background=dark

" --------------- solarized 
" set background=dark
" colorscheme solarized
" set termguicolors
" let g:solarized_termcolors=16
" let g:solarized_background=234

" --------------- 分割符
set fillchars=vert:\|,fold:-,diff:-
hi VertSplit ctermbg=NONE  guifg=#075554 guibg=NONE

" -------------- 没字符下的背景色 
hi NonText guifg=bg

