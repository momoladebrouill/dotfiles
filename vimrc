filetype on
syntax on
set belloff=all
set nocompatible

filetype plugin indent on
set encoding=utf-8

" for indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" for line numbers
set number
set relativenumber

" for folding
set foldmethod=indent
set foldlevel=0
set foldnestmax=2


" black and white colors
" colorscheme monotone

" Orange, whiite and grey
colorscheme Base2Tone_EarthDark
" Prevent the theme from changing the terminal background color
highlight Normal ctermbg=NONE 
highlight NonText ctermbg=NONE
highlight LineNr ctermbg=NONE

