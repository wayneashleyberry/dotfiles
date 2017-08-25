call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'farmergreg/vim-lastplace'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-eunuch'
Plug 'fatih/vim-go'
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
let g:choosewin_label = '123456789'
let g:choosewin_tablabel = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

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
set inccommand=split
set list listchars=tab:\→\ ,eol:¬,extends:…,precedes:❮,extends:❯,trail:·
set noshowmode noshowcmd
set nowrap
" set relativenumber
set splitright splitbelow
set tabstop=2
set termguicolors
set undofile nobackup noswapfile

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

let g:polyglot_disabled = ['go']

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 0
let g:go_gocode_unimported_packages = 1

let g:go_autodetect_gopath = 1
let g:go_info_mode = "guru"

" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0

let g:go_modifytags_transform = 'camelcase'

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

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
