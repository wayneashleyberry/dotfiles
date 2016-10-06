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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'
call plug#end()

let mapleader = '\'

color molotov

set nobackup
set noswapfile
set undofile
set textwidth=80
set clipboard^=unnamedplus,unnamed
set noesckeys " Faster escaping from insert mode
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
set number relativenumber " Line numbers
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shiftwidth=4 " The # of spaces for indenting
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
set list listchars=eol:¬,extends:…,precedes:❮,extends:❯,trail:·

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

" Tab through brackets and braces etc.
map <Tab> %

" Open a split window and switch to it
map <leader>w :vsp<cr>

" Fuzzy file finder
map <C-p> :Files<CR>

" Edit and source config files
command! Config :e $MYVIMRC
command! SourceConfig :source $MYVIMRC

" Save files when losing focus, essentially autosave.
au FocusLost * :silent! wa!
au BufLeave * :silent! wa!

" Snippets
nnoremap ,html :-1read $HOME/src/github.com/h5bp/html5-boilerplate/dist/index.html<CR>5jelelli

" TextMate style formatting
nnoremap Q gqip
vnoremap Q gq
nnoremap ql ^vg_gq

" Fix some common and easy mistakes when typing commands:
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" Indent lines with ctrl+[ and ctrl+]
nmap <C-]> >>
nmap <C-[> <<
vmap <C-[> <gv
vmap <C-]> >gv

" Change the cursor shape in normal/insert mode
" https://github.com/neovim/neovim/wiki/FAQ#how-can-i-change-the-cursor-shape-in-the-terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
