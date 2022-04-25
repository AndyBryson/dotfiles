set nocompatible              " be iMproved
filetype off                  " required!

syntax on

map <silent> <C-n> :NERDTreeFocus<CR>
set pastetoggle=<F10>

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

" Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

call yankstack#setup()

" let g:ctrlp_map = '<c-p>'
" let g:NERDTreeDirArrows=0
