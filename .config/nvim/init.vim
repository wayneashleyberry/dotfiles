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

" Colors
Plug 'dracula/vim'
Plug 'reedes/vim-colors-pencil'
Plug 'morhetz/gruvbox'
call plug#end()

set background=dark

color gruvbox

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
