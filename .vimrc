call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/fish.vim',   { 'for': 'fish' }
call plug#end()

let mapleader = '\'

set guifont=Meslo\ LG\ L\ DZ:h14
set linespace=5

set background=dark
let g:gruvbox_invert_selection=0
let g:gruvbox_bold=0
let g:airline_theme='gruvbox'
color gruvbox

set guioptions=

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" set cursorline " Highlight current line
set autoindent " Copy indent from last line when starting new line
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set diffopt=filler " Add vertical spaces to keep right and left aligned
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=5 " Open all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=1 " Break before 1-letter words
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=c " Format comments
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=n " Recognize numbered lists
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=r " Continue comments by default
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set magic " Enable extended regexes
set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set relativenumber " Use relative line numbers
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shiftwidth=2 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=1 " Only show tabs when there's more than one
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set tabstop=4
set termguicolors " Enable true color support
set title " Show the filename in the window titlebar
set undofile " Persistent Undo
set viminfo=%,'9999,s512 " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildignore+=.DS_Store
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file

augroup ctrlp_config
  autocmd!
  let g:ctrlp_clear_cache_on_exit = 0 " Do not clear filenames cache, to improve CtrlP startup
  let g:ctrlp_lazy_update = 40 " Set delay to prevent extra search
  " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use python fuzzy matcher for better performance
  " let g:ctrlp_max_files = 0 " Set no file limit, we are building a big project
  let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
  let g:ctrlp_open_new_file = 'r' " Open newly created files in the current window
  let g:ctrlp_open_multiple_files = 'ij' " Open multiple files in hidden buffers, and jump to the first one
  let g:ctrlp_working_path_mode = 'r'
augroup END

augroup vim_go
  autocmd!
  let g:go_fmt_command = "goimports"
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_types = 1
augroup END

augroup vim_move
  autocmd!
  let g:move_key_modifier = 'C'
augroup END

augroup filetype_fish
  autocmd!
  au BufRead,BufNewFile *.fish set ft=fish
augroup END

" Search
nnoremap <leader><space> :noh<cr>

" Use <Tab> for bracket matching
map <Tab> %
