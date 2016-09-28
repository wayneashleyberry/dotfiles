call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'
call plug#end()

syntax off
let g:syntax_on = "off"
let mapleader = '\'

" Perf
set fillchars=diff:⣿,vert:│
set fillchars=diff:⣿,vert:\|
set synmaxcol=200
set lazyredraw

" Lines shouldn't be longer than 80 characters
" http://google-styleguide.googlecode.com/svn/trunk/pyguide.html#Line_length
set textwidth=79
set colorcolumn=80

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq
nnoremap ql ^vg_gq

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

color molotov

set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo
set noswapfile

set clipboard+=unnamedplus " Use system clipboards when available
set cursorline " Highlight the line the cursor is on
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
set tabstop=4 " Render tabs 4 spaces wide
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=5 " Open all folds by default
set foldmethod=indent " Indentation is used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set ignorecase " Ignore case of searches
set magic " Enable extended regexes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shiftwidth=4 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=0 " Never show the tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set title " Show the filename in the window titlebar
set termguicolors " Enable true color support
set undofile " Persistent Undo
set viminfo=%,'9999,s512 " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
set relativenumber

augroup vim_go
  autocmd!
  let g:go_fmt_command = "goimports"
  " let g:go_highlight_build_constraints = 1
  " let g:go_highlight_fields = 1
  " let g:go_highlight_functions = 1
  " let g:go_highlight_methods = 1
  " let g:go_highlight_operators = 1
  " let g:go_highlight_types = 1
augroup END

augroup vim_move
  autocmd!
  let g:move_key_modifier = 'C'
augroup END

" Modern directional keys
noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap <leader><space> :noh<cr>
map <Tab> %
map <leader>w :vsp<cr>
map <C-p> :Files<CR>

command! Config :vs $MYVIMRC

" Autosave
au FocusLost * :silent! wa!
au BufLeave * :silent! wa!
