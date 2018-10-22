"""     ____                       _      __     ___                       """   
"""    / ___|___  _ __   ___  _ __( )___  \ \   / (_)_ __ ___  _ __ ___    """
"""   | |   / _ \| '_ \ / _ \| '__|// __|  \ \ / /| | '_ ` _ \| '__/ __|   """
"""   | |__| (_) | | | | (_) | |    \__ \   \ V / | | | | | | | | | (__    """
"""    \____\___/|_| |_|\___/|_|    |___/    \_/  |_|_| |_| |_|_|  \___|   """
"""                                                                        """

"""Basic Settings
"let &rtp = substitute(&rtp, '\.vim\>', '.vimBAK', 'g')
"let &rtp += '/home/conor/.vimBAK/autoload'
execute pathogen#infect()
"execute pathogen#helptags()
set nocompatible
syntax on
filetype plugin on
set laststatus=2 "set to laststatus=2 for lightline
"Enable col and line numbering in status
"set statusline=%<\ %f\ %m%r%y%w%=\ L:\ \%l\/\%L\ C:\ \%c\
set noshowmode
colorscheme landscape
set showmatch        "highlights matching parantheses
" set number           "Show current line number
" set relativenumber   "Show relative line number
set nrformats=	     "Interpet numbers with leading 0s as decimal
let mapleader="\<Space>"
"set foldmethod=indent
set backspace=indent,eol,start
set hidden	"Allows switching from a buffer without saving changes
set path=.,**	"Set default search path to current dir & subdirs
set incsearch	"Highlight next match when searching
set ignorecase	"Make search case insensitive
set smartcase
set updatetime=100
set mouse=a
let g:python3_host_prog='/bin/python3'
set t_Co=256
if has('nvim')
    set inccommand=split    "Open buffer when doing search and replace, nvim only
endif

"set ruler
set wrap lbr 				" Wrap on words.
filetype indent on   "indentation stuff
"set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
autocmd Filetype python set textwidth=79
autocmd Filetype javascript set tabstop=5
autocmd Filetype javascript set softtabstop=5
autocmd Filetype javascript set shiftwidth=5
" Enable tab completion:
"set wildmode=longest,list,full
set wildmenu
set wildmode=longest:full,full
"set wildmode=list:longest,full
"set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
"Use F10 to cycle buffers
nnoremap <F10> :b <C-Z>

" if (has("termguicolors"))
"   set termguicolors
" endif

"""Plugin settings
let g:livepreview_previewer = 'mupdf'  "Set Tex Live Preview pdf viewer
"Map NERDTree toggle to Leader-N
nnoremap <silent> <leader>j :NERDTreeToggle<CR>
"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
 "let g:airline_theme='cobalt2'
" let g:airline_theme='hybridline'
 let g:airline_theme='dark'
let g:airline_exclude_preview=1

"ALE
let g:ale_fixers = {
\   'python': ['autopep8'],
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'java': ['google_java_format'],
\   'c': ['clang-format'],
\}

"Snippets
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Tagbar
nnoremap <silent> <leader>l :TagbarOpenAutoClose<CR><C-W>l
"Fuzzy Find
nnoremap <silent> <leader>t :CtrlPBufTag<CR>
"let g:ctrlp_working_path_mode = 'wa'
"Vdebug
nnoremap <silent> <leader>b :Breakpoint<CR>
"Python Mode
let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 0

" When shortcut files are updated, renew configs with new material
autocmd BufWritePost ~/.config/Scripts/folders,~/.config/Scripts/configs !bash ~/.config/Scripts/shortcuts.sh

"General remaps
inoremap jk <Esc>
nnoremap ; :
nnoremap : ;
" nnoremap <silent> <leader>v :bd!|vs<CR>
"Cycle through buffers with <Tab> and <S-Tab>
nnoremap <silent> <Tab> :bnext<CR>: redraw<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>: redraw<CR>
"clear search highlight on esc
nnoremap <silent> <esc> :noh<return><esc>
"""Clipboard mappings
"Uses + register: the system CLIPBOARD register accessible with <C-V> and <C-C>
nnoremap <silent> <Leader>y "+y 
nnoremap <silent> <Leader>P "+P
vnoremap <silent> <Leader>Y "+y
vnoremap <silent> <Leader>P "+P


"""ipynb
autocmd Filetype ipynb nnoremap <leader>b :VimpyterInsertPythonBlock<CR>
"autocmd Filetype ipynb nnoremap <Space> za

"""jsx
"prettier linting engine
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

"""LATEX
"autostart live preview when a .tex file is opened
autocmd BufNewFile,BufRead *.tex :LLPStartPreview
"Turn on spellcheck 
autocmd BufNewFile,BufRead *.tex :set spell spelllang=en_uk

" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>

" deoplete options
set runtimepath+=~/.vim/bundle/deoplete.nvim/
set runtimepath+=~/.vim/bundle/deoplete-jedi/
set runtimepath+=~/.vim/bundle/LanguageClient-neovim
if has ('nvim')
    let g:deoplete#enable_at_startup = 1
endif
let g:deoplete#enable_smart_case = 1

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

" Disable the candidates in Comment/String syntaxes.
" call deoplete#custom#source('_',
"             \ 'disabled_syntaxes', ['Comment', 'String'])

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }
" set sources
let g:deoplete#sources = {}
" let g:deoplete#sources.cpp = ['LanguageClient']
" let g:deoplete#sources.python = ['LanguageClient']
" let g:deoplete#sources.python3 = ['LanguageClient']
" let g:deoplete#sources.rust = ['LanguageClient']
" let g:deoplete#sources.c = ['LanguageClient']
" let g:deoplete#sources.vim = ['vim']
let g:deoplete#sources.javascript = ['LanguageClient']
let g:clang_library_path='/usr/lib64/libclang.so'
" deoplete-racer config
" let g:deoplete#sources#rust#racer_binary='/Users/aenayet/.cargo/bin/racer'
" let g:deoplete#sources#rust#rust_source_path= '/Users/aenayet/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
