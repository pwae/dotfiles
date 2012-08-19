version 6.0
if &cp | set nocp | endif
map Q gq
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=50
set hlsearch
set incsearch
set mouse=a
set ruler
set shiftwidth=4
set showcmd
set tabstop=4
set ts=4
set wildignore=*.pyc
" vim: set ft=vim :

if has('mouse')
  set mouse=a
endif

syntax on

set background=dark
color darkblue
set autoindent

" This if for python folding
au BufRead,BufNewFile *.py set foldmethod=indent
au BufRead,BufNewFile *.py set foldnestmax=1
au BufRead,BufNewFile *.py nnoremap <space> za
au BufRead,BufNewFile *.py vnoremap <space> zf

autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
