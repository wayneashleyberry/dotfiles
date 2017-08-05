call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'farmergreg/vim-lastplace'
Plug 'lambdalisue/gina.vim'
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
Plug 'prettier/vim-prettier', {
	\ 'do': 'yarn install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
call plug#end()

let mapleader = '\'

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#single_quote = 'false'

color gruvbox

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
" set relativenumber number
set splitright splitbelow
set termguicolors
set undofile nobackup noswapfile
set tabstop=2
set inccommand=split

function GitBranch() abort
  let branch = gina#component#repo#branch()
  return printf('%s', branch)
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranch'
      \ },
      \ }

let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
" let g:move_key_modifier = 'C'

let g:polyglot_disabled = ['go']

au FileType go set noexpandtab
au FileType go set shiftwidth=2
au FileType go set softtabstop=2
au FileType go set tabstop=2

let g:go_auto_type_info = 1
let g:go_fmt_command='goimports'
let g:go_play_open_browser = 1

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

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

augroup filetypedetect
    au BufRead,BufNewFile *.yml.template setfiletype yaml
augroup END
