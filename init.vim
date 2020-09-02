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

Plug 'Valloric/YouCompleteMe'

" NERDTreeToggle + git
" Documentation https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

Plug 'majutsushi/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'jmcantrell/vim-virtualenv'
Plug 'davidhalter/jedi-vim'
Plug 'mitsuhiko/vim-jinja'

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

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" completion-manager
" https://github.com/ncm2/ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

"searching plugin + nedd also install ack for your machine
"https://vimawesome.com/plugin/ack-vim
Plug 'mileszs/ack.vim'


" NERDTreeToggle + git
" Documentation https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"need install also on your machine 
"https://github.com/junegunn/fzf
Plug 'junegunn/fzf'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'blueshirts/darcula'
Plug 'iCyMind/NeoSolarized'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'sainnhe/edge'

call plug#end()


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


" colorscheme
set termguicolors
colorscheme NeoSolarized
set background=dark


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
 let g:airline#extensions#tabline#show_close_button = 0
 let g:airline#extensions#ale#enabled = 1
 let g:airline#extensions#tagbar#enabled = 1
 let g:airline#extensions#tabline#buffer_idx_mode = 1
 let g:airline#extensions#tabline#left_sep = ' '

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


"=====================================================
" Tagbar settings
"=====================================================
let g:tagbar_autofocus = 0 " disable Tagbar autofocus
let g:tagbar_sort = 0 "tagbar shows tags in order of they created in file
let g:tagbar_foldlevel = 0 "close tagbar folds by default

nmap  <F8> : TagbarToggle <CR>


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

"====================================================
"Nerd git settings
"===================================================
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeUseSimpleIndicator = 1
let g:NERDTreeGitStatusConcealBrackets = 1 " hide the boring brackets([ ])?


"=====================================================
" LanguageClient settings
"=====================================================
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/eveissim/.local/bin/pyls'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'], 
    \ }
let g:LanguageClient_selectionUI = 'fzf'
" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

"=====================================================================================================
" Default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin
" solarized vertSplitBar style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined
" or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
" Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

" Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
" text output by commands like `ls` aren't what you expect, you might want to
" try disabling this option. Default value:
let g:neosolarized_termBoldAsBright = 1




" If you want find anything plugin then go https://vimawesome.com/?q=cat%3Acompletion
