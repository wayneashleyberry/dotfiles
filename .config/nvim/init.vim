call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'farmergreg/vim-lastplace'
" Plug 'lambdalisue/gina.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roman/golden-ratio'
Plug 'tpope/vim-eunuch'
Plug 'fatih/vim-go'
Plug 'nightsense/seabird'
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

" let g:deoplete#enable_at_startup = 1

color gruvbox

set autoread
set autowrite
set background=dark
" set cursorline
set gdefault
set ignorecase smartcase wildignorecase
set listchars=tab:\→\ ,eol:¬,extends:…,precedes:❮,extends:❯,trail:·
" set nolazyredraw
set noshowmode noshowcmd
set nowrap
" set relativenumber number
set splitright splitbelow
set termguicolors
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set undofile nobackup noswapfile
set tabstop=2
set inccommand=split

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

let g:gitgutter_sign_column_always = 0

let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
" let g:move_key_modifier = 'C'

let g:polyglot_disabled = ['go']

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_auto_type_info = 1
let g:go_fmt_command='goimports'
let g:go_play_open_browser = 1

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

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Grep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
