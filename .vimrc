"                                                ,  ,
"                                               / \/ \
"                                              (/ //_ \_
"     .-._                                      \||  .  \
"      \  '-._                            _,:__.-"/---\_ \
" ______/___  '.    .--------------------'~-'--.)__( , )\ \
"`'--.___  _\  /    |                         ,'    \)|\ `\|
"     /_.-' _\ \ _:,_        HERE BE DRAGONS!       " ||   (
"   .'__ _.' \'-/,`-~`       ----------------         |/
"       '. ___.> /=,|                                 |
"        / .-'/_ )  '---------------------------------'
"        )'  ( /(/
"             \\ "
"              '=='
"
set nocompatible
filetype off
filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'matze/vim-move'
Plug 'ntpeters/vim-better-whitespace'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'
if (has('gui_macvim'))
    Plug 'ctrlpvim/ctrlp.vim'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
endif
call plug#end()

color molotov

set autowrite
set lazyredraw
set nobackup
set noerrorbells
set noswapfile
set number
set relativenumber
set splitbelow
set splitright
set termguicolors
set visualbell

command! Config :e $MYVIMRC
command! SourceConfig :source $MYVIMRC

let g:move_key_modifier = 'C'

if (has('gui_macvim'))
    let g:ctrlp_clear_cache_on_exit = 1
    let g:ctrlp_custom_ignore = 'node_modules\|vendor'
    let g:ctrlp_working_path_mode = 0
else
    map <C-p> :Files<CR>
endif

let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_bin_path = expand("~/bin")
augroup go
  autocmd!
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
augroup end

nnoremap ,html :-1read $HOME/src/github.com/h5bp/html5-boilerplate/dist/index.html<CR>5jelelli

noremap j gj
noremap k gk

map <Tab> %
map <leader>w :vsp<cr>
nnoremap <space> zz
nnoremap <leader><space> :noh<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

nmap <C-]> >>
nmap <C-[> <<
vmap <C-[> <gv
vmap <C-]> >gv
