"""Basic Settings
"let &rtp = substitute(&rtp, '\.vim\>', '.vimBAK', 'g')
"let &rtp += '/home/conor/.vimBAK/autoload'
execute pathogen#infect()
syntax on
filetype plugin on
set laststatus=2 "set to laststatus=2 for lightline
"Enable col and line numbering in status
"set statusline=%<\ %f\ %m%r%y%w%=\ L:\ \%l\/\%L\ C:\ \%c\
set noshowmode
colorscheme landscape
set showmatch        "highlights matching parantheses
set number           "Show current line number
set relativenumber   "Show relative line number
set nrformats=	     "Interpet numbers with leading 0s as decimal
"let mapleader=","
let mapleader="\<Space>"
"set foldmethod=indent
set backspace=indent,eol,start
set hidden	"Allows switching from a buffer without saving changes
set path=.,**	"Set default search path to current dir & subdirs
set incsearch	"Highlight next match when searching
set ignorecase	"Make search case insensitive
set smartcase
set updatetime=100

"set ruler
"set wrap lbr 				" Wrap on words.
"filetype indent on   "indentation stuff tab now two spaces
"set nowrap
set tabstop=4
"set shiftwidth=2
"set expandtab
set shiftwidth=4
let &softtabstop = &shiftwidth
set smartindent
set autoindent
" Enable tab completion:
"set wildmode=longest,list,full
set wildmenu
set wildmode=longest:full,full
"set wildmode=list:longest,full
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
"Use F10 to cycle buffers
nnoremap <F10> :b <C-Z>

"""Plugin settings
let g:ycm_python_binary_path = '/opt/anaconda/bin/python3'	"You complete me binary - use anaconda python3
let g:livepreview_previewer = 'mupdf'  "Set Tex Live Preview pdf viewer
"Map NERDTree toggle to Leader-N
nnoremap <leader>n :NERDTreeToggle<CR>
"Jedi python completion
let g:jedi#completions_command = "<Tab>"
"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybridline'
let g:airline_exclude_preview=1
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"Tagbar
nnoremap <F8> :TagbarToggle<CR>
"Fuzzy Find
nnoremap <leader>t :CtrlPTag<CR>
"Lightline
"let g:lightline = {
"      \ 'colorscheme': 'landscape',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'fugitive#head'
"      \ },
"      \ }


" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew configs with new material
autocmd BufWritePost ~/.config/Scripts/folders,~/.config/Scripts/configs !bash ~/.config/Scripts/shortcuts.sh

"General remaps
inoremap jj <Esc>
nnoremap ; :
nnoremap : ;
"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"Cycle through buffers with <Tab> and <S-Tab>
nnoremap <Tab> :bnext<CR>:redraw<CR>:silent ls<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:silent ls<CR>
"fast recursive file find
"nnoremap <leader>e :edit **/*
nnoremap <leader>f :find *
"""Python
"PIP8 Settings
" autocmd Filetype python    :set tabstop=4
" autocmd Filetype python    :set softtabstop=4
" autocmd Filetype python    :set shiftwidth=4
" autocmd Filetype python    :set textwidth=79
" autocmd Filetype python    :set expandtab
" autocmd Filetype python    :set autoindent
" autocmd Filetype python    :set fileformat=unix

"""ipynb
autocmd Filetype ipynb nnoremap <leader>b :VimpyterInsertPythonBlock<CR>
"autocmd Filetype ipynb nnoremap <Space> za

"""LATEX
"autostart live preview when a .tex file is opened
autocmd BufNewFile,BufRead *.tex :LLPStartPreview
"Turn on spellcheck #NOTE get uk spellcheck pack!
"autocmd BufNewFile,BufRead *.tex :set spell spelllang=en_us

" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>

" Compile document using xelatex:
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>

" Code snippets
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i