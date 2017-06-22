syntax enable
set number
set showcmd
set laststatus=2
set nowrap
set number
set fileformat=unix
set backspace=2 "可随时用倒退键删除
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set hlsearch
set nocompatible
filetype off
set encoding=utf8 "设置内部编码utf8
set fileencoding=utf8 "当前编辑的文件编码
set fileencodings=utf8-bom,utf8,gbk,gbk2312,big5 "支持打开的编码文件

" Auto add head info
"  .py file into add header

function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

" .sh file
function HeaderBash()
    call setline(1, "#!/usr/bin/env bash")
    normal G
    normal o
endf
autocmd bufnewfile *.sh call HeaderBash()


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Bundle 'kien/ctrlp.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
" Bundle 'vim-airline'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Yggdroot/indentLine' 
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'AndrewRadev/splitjoin.vim'
"Bundle 'plasticboy/vim-markdown'
call vundle#end()
filetype plugin indent on

"indentLine 代码缩进线标志线
let g:indentLine_enabled = 1
let g:indentLine_char = '¦' 
let g:indentLine_color_term = 239
"映射到ctrl+i键 
map <C-i> :IndentLinesToggle<CR>

" nerd
map <C-e> :NERDTreeToggle<CR> 

"write 
"map <C-w> :w<CR>

"mapleader
let mapleader = "\<Space>"
nnoremap <Leader>n :new<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P


" molokai theme
colorscheme molokai

" vim-go
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>t  <Plug>(go-doc)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>d <Plug>(go-describe)
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1


" vim-powerline
"set guifont=PowerlineSymbols\ for\ Powerline
"set nocompatible
"set t_Co=256
"let g:Powerline_symbols = 'fancy'

" neocomplete
" let g:neocomplete#enable_at_startup = 1

" Plugin YCM settings.
"set completeopt=longest,menu
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'gitcommit' : 1,
    \}
