call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'farmergreg/vim-lastplace'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-eunuch'
" Plug 'sbdchd/neoformat'
Plug 'sgur/vim-editorconfig'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
call plug#end()

color gruvbox
let g:gruvbox_sign_column = 'bg0'

let mapleader = '\'

let g:terminal_color_0 = '#282828'
let g:terminal_color_1 = '#cc241d'
let g:terminal_color_2 = '#98971a'
let g:terminal_color_3 = '#d79921'
let g:terminal_color_4 = '#458588'
let g:terminal_color_5 = '#b16286'
let g:terminal_color_6 = '#689d6a'
let g:terminal_color_7 = '#a89984'
let g:terminal_color_8 = '#928374'
let g:terminal_color_9 = '#fb4934'
let g:terminal_color_10 = '#b8bb26'
let g:terminal_color_11 = '#fabd2f'
let g:terminal_color_12 = '#83a598'
let g:terminal_color_13 = '#d3869b'
let g:terminal_color_14 = '#8ec07c'
let g:terminal_color_15 = '#ebdbb2'

set autoread
set autowrite
set background=dark
set cursorline
set gdefault
set ignorecase smartcase wildignorecase
set list listchars=tab:\→\ ,eol:¬,extends:…,precedes:❮,extends:❯,trail:·
set nolazyredraw
set noshowmode noshowcmd
set nowrap
set relativenumber number
set splitright splitbelow
set termguicolors
set undofile nobackup noswapfile

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
" let g:move_key_modifier = 'C'

map <C-p> :Files<CR>
map <Tab> %
map <leader>w :vsp<cr>
nnoremap <leader><space> :noh<cr>
nnoremap N Nzzzv
nnoremap n nzzzv
nnoremap y "*y
vnoremap y "*y

command! Config :e $MYVIMRC
command! SourceConfig :source $MYVIMRC

augroup autosave
    au!
    au FocusLost * :silent! wa!
    au BufLeave * :silent! wa!
augroup END

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * Neoformat
" augroup END

" Faster split navigation (works in terminals as well)
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
