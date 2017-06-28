call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'farmergreg/vim-lastplace'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'sbdchd/neoformat'
Plug 'sgur/vim-editorconfig'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
call plug#end()

color gruvbox

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
set background=dark
set nolazyredraw
set autowrite
set cursorline
set ignorecase smartcase wildignorecase
set list listchars=tab:\→\ ,eol:¬,extends:…,precedes:❮,extends:❯,trail:·
set undofile nobackup noswapfile
set noshowmode noshowcmd
set nowrap
set relativenumber number
set splitright splitbelow
set termguicolors

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:move_key_modifier = 'C'
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let mapleader = '\'

map <C-p> :GFiles<CR>
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

augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
