"" ensimag vim config file version 1.0.3
"" this file is intended for vim 8
"" before using it you will need to
"" - install plug with :
""      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"" (see https://github.com/junegunn/vim-plug)
"" - install the languageserver server for each language you indend to use :
""    * pyls for python (see https://github.com/palantir/python-language-server)
""    * rls for rust (see https://github.com/rust-lang-nursery/rls)
""    * clangd for c
"" - install some font with powerline symbols for eye candy and icons
"" (see https://github.com/powerline/fonts)
"" - change plugin directory to ~/.vim/plugged
"" (uncomment line 22 and comment line 21)

"" after that copy this file as your ~/.vimrc and execute :PlugInstall

set nocompatible
filetype on

filetype plugin indent on


set encoding=utf-8

" for the status bar
set noshowmode
syntax on
set number

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" replace tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" some more rust
let g:LanguageClient_loadSettings = 1 " this enables you to have per-projects languageserver settings in .vim/settings.json
let g:rustfmt_autosave = 1
let g:rust_conceal = 1
set hidden
au BufEnter,BufNewFile,BufRead *.rs syntax match rustEquality "==\ze[^>]" conceal cchar=≟
au BufEnter,BufNewFile,BufRead *.rs syntax match rustInequality "!=\ze[^>]" conceal cchar=≠

" run language server for python, rust and c
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'],
    \ 'c' : ['clangd'] }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR> " hit :pc to close the preview window
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
set relativenumber
set foldmethod=indent
set foldlevel=0
set foldnestmax=1
let g:monotone_color = [120, 100, 70] " Sets theme color to bright green
let g:monotone_secondary_hue_offset = 200 " Offset secondary colors by 200 degrees
let g:monotone_emphasize_comments = 1 " Emphasize comments
let g:mergetool_layout ='rm'
let g:mergetool_prefer_revision = 'local'
colorscheme monotone
set belloff=all
