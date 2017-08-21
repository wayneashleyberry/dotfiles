call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'farmergreg/vim-lastplace'
Plug 'fxn/vim-monochrome'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-eunuch'
Plug 'fatih/vim-go'
Plug 'nightsense/seabird'
Plug 'sgur/vim-editorconfig'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 't9md/vim-choosewin'
Plug 'prettier/vim-prettier', {
	\ 'do': 'yarn install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
call plug#end()

nmap - <Plug>(choosewin)

let mapleader = '\'

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#trailing_comma = 'none'

color gruvbox

set autoread
set autowrite
set background=dark
set gdefault
set ignorecase smartcase wildignorecase
set listchars=tab:\→\ ,eol:¬,extends:…,precedes:❮,extends:❯,trail:·
set noshowmode noshowcmd
set nowrap
set splitright splitbelow
set termguicolors
set undofile nobackup noswapfile
set tabstop=2
set inccommand=split
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

let g:gitgutter_sign_column_always = 0

let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']

let g:polyglot_disabled = ['go']

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_auto_type_info = 1
let g:go_fmt_command='goimports'
let g:go_play_open_browser = 1

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

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
