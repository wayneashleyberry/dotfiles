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
call plug#begin('~/.config/nvim/plugged')
Plug 'editorconfig/editorconfig-vim', { 'for': ['php', 'javascript']}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'
if (has('gui_macvim'))
    Plug 'ctrlpvim/ctrlp.vim'
endif
if (has('nvim'))
    Plug 'neomake/neomake'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
endif
call plug#end()

let mapleader = '\'

color molotov

if has('persistent_undo')
  set undofile
  " Although neovim has a good default for undodir, vim and macvim do not… so for
  " consistency we'll set it explicitly here:
  set undodir=$HOME/.config/nvim/undo//
endif

set nobackup
set noswapfile
set textwidth=80
set noesckeys " Exit insert mode faster
set expandtab " Expand tabs to spaces
set tabstop=4 " Render tabs 4 spaces wide
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
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (lightline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Don't wrap text
" set number relativenumber " Line numbers
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shiftwidth=4 " The # of spaces for indenting
set shortmess=I " Hides welcome message
set showtabline=0 " Never show the tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set title " Show the filename in the window titlebar
set termguicolors " Enable true color support
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildignorecase " Ignore case when completing filenames and directories
set list listchars=tab:\|\ ,eol:¬,extends:…,precedes:❮,extends:❯,trail:· " Fancy invisible characters

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1

" Move lines around using <C-k> and <C-j>
let g:move_key_modifier = 'C'

" Modern directional keys
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Clear search highlighting using the <space> key
nnoremap <leader><space> :noh<cr>

" Use <Tab> for bracket matching
map <Tab> %

" Open a split window and switch to it
map <leader>w :vsp<cr>

" Fuzzy file finder
if (has('gui_macvim'))
  let g:ctrlp_working_path_mode = 0
else
    map <C-b> :Buffers<CR>
    map <C-p> :Files<CR>
endif

" Edit and source config files
command! Config :e $MYVIMRC
command! SourceConfig :source $MYVIMRC

" Save files when losing focus, essentially autosave.
au FocusLost * :silent! wa!
au BufLeave * :silent! wa!

" Snippets
nnoremap ,html :-1read $HOME/src/github.com/h5bp/html5-boilerplate/dist/index.html<CR>/><<CR>:set nohlsearch<CR>a

" TextMate style formatting
nnoremap Q gqip
vnoremap Q gq
nnoremap ql ^vg_gq

" Fix some common and easy mistakes when typing commands:
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" Change the cursor shape in normal/insert mode:
" https://github.com/neovim/neovim/wiki/FAQ#how-can-i-change-the-cursor-shape-in-the-terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" These will make it so that going to the next result in a search will center on
" the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Yank to system clipboard
if !has('gui_running')
    nnoremap y "*y
    vnoremap y "*y
endif

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Neomake
if (has('nvim'))
    autocmd! BufReadPost,BufWritePost * Neomake
    let g:neomake_php_enabled_makers = ['php', 'phpcs', 'phpmd']
    let g:neomake_javascript_enabled_makers = ['eslint']
endif
