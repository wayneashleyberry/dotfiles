call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'roman/golden-ratio'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
call plug#end()

set clipboard=unnamed
set number relativenumber
set termguicolors
set list
set tabstop=4
set ignorecase smartcase
set incsearch

let g:dracula_italic = 0

color dracula
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

let g:move_key_modifier = 'C'

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

let g:go_fmt_command = "goimports"
