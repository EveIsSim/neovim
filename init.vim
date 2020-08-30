set encoding=utf-8
syntax on
set number
set guifont=DroidSansMono\ Nerd\ Font\ 11

" setting tab
set expandtab
set smarttab
set expandtab ts=4 sw=4 ai

set t_Co=256 
set scrolloff=5 " scroll by 5 lines
set cursorline

"setting work vim work faster
set lazyredraw "https://stackoverflow.com/questions/307148/vim-scrolling-slowly"
set ttyfast

" resolve problems with copy buffer only vim
" if you not use this setting, then read https://vim.fandom.com/wiki/Accessing_the_system_clipboard
set clipboard+=unnamedplus

" https://vim.fandom.com/wiki/Word_wrap_without_line_breaks 
set wrap
set linebreak

filetype on
filetype plugin indent on

set nocompatible "Отключает обратную совместимость с Vi

set hlsearch
set incsearch

" add 30 aug 2020
set ls=2 " Always show status line

" Always draw the signcolumn.
set signcolumn=yes

"Plugins here
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Autocomplite current values
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'mitsuhiko/vim-jinja'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" syntax dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Python syntax 
Plug 'hdima/python-syntax'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" NGINX syntax
Plug 'chr4/nginx.vim'

" Work with git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Find folder
Plug 'kien/ctrlp.vim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'blueshirts/darcula'
Plug 'iCyMind/NeoSolarized'
Plug 'ayu-theme/ayu-vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jmcantrell/vim-virtualenv'

" completion-manager
" https://github.com/ncm2/ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

call plug#end()


" colorscheme
set termguicolors
colorscheme NeoSolarized 
set background=dark


" mappings
map <C-n> :NERDTreeToggle<CR>

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
        let t:curwin = winnr()
        exec "wincmd ".a:key
        if (t:curwin == winnr())
                if (match(a:key,'[jk]'))
                        wincmd v
                else
                        wincmd s
                endif
                exec "wincmd".a:key
        endif
endfunction


 "=====================================================
 " Airline settings
 "=====================================================
 set laststatus=2
 let g:airline_theme='solarized_flood'
 let g:airline_solarized_bg='dark'
 let g:airline_powerline_fonts = 1
 let g:airline_skip_empty_sections = 1
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#tab_nr_type = 1
 " let g:airline#extensions#tabline#show_tab_nr = 1
 let g:airline#extensions#tabline#show_close_button = 0
 let g:airline#extensions#ale#enabled = 1
 let g:airline#extensions#tagbar#enabled = 1
 let g:airline#extensions#tabline#buffer_idx_mode = 1
 " let g:airline#extensions#tabline#show_splits = 0
 " let g:airline#extensions#tabline#formatter = 'unique_tail'
 let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

"====================================================
"Python syntax
"====================================================
let python_highlight_all = 1

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"=====================================================
"YouCompleteMe
"=====================================================
let g:ycm_autoclose_preview_window_after_completion=1

"=====================================================
"Semshi
"=====================================================
let g:deoplete#auto_complete_delay = 100


"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"endif
"

"=====================================================
" Tagbar settings
"=====================================================
let g:tagbar_autofocus = 0 " disable Tagbar autofocus
let g:tagbar_sort = 0 "tagbar shows tags in order of they created in file
let g:tagbar_foldlevel = 0 "close tagbar folds by default

nmap  <F8> : TagbarToggle <CR>


"====================================================
"python hosts
"====================================================
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'


"====================================================
" setting ncm2
"====================================================

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"=====================================================
" NerdComenter settings
"=====================================================
" Add spaces after comment delimiters by default 
" https://github.com/preservim/nerdcommenter/issues/278
let g:NERDSpaceDelims = 1

