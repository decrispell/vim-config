" PLUGINS (via vim-plug)
let vimplug_root = $HOME . "/vim-config/plugged"
call plug#begin(vimplug_root)
" Solarized colorscheme
Plug 'altercation/vim-colors-solarized'
" sensible defaults
Plug 'tpope/vim-sensible'
" easy switching between headers and source
Plug 'vim-scripts/a.vim'
" protobuf syntax
Plug 'uarun/vim-protobuf'
" json syntax
Plug 'elzr/vim-json'
" fugitive for git integration
Plug 'tpope/vim-fugitive'
" Ctrl-P for fuzzy file searching
Plug 'kien/ctrlp.vim'
" mundo/gundo for undo tree traversal
Plug 'simnalamburt/vim-mundo'
" lightweight status bar
Plug 'vim-airline/vim-airline'
" themes for airline
Plug 'vim-airline/vim-airline-themes'
" lightweight file manager settings
Plug 'tpope/vim-vinegar'
" explore open buffers
Plug 'jlanzarotta/bufexplorer'
" syntax checking
Plug 'scrooloose/syntastic'
if !has('win32')
  " Autocompletion / goto definition / etc.
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
endif
" The Silver Searcher (grep/ack replacement)
Plug 'rking/ag.vim'
" Convenient mappings for common unixy commands
Plug 'tpope/vim-eunuch'
" Color matching parens,braces,etc. with matching colors for better readability
Plug 'luochen1990/rainbow'
" Make editing Latex documents nicer
Plug 'LaTeX-Box-Team/LaTeX-Box'
" Comment text using 'gc'
Plug 'tpope/vim-commentary'
" git status in the sign column
Plug 'airblade/vim-gitgutter'

call plug#end()
" END PLUGINS

" enable mouse in all modes
set mouse=a

"enable syntax highlighting
syntax on

"turn on smart indenting
filetype plugin indent on

" c/c++ indentation options. See :help cinoptions-values for description
set cino=(0,N-s,g0

"highlight search things
set hlsearch

"set tab width
set tabstop=2
set shiftwidth=2
" insert spaces in place of <tab> - use CTRL-V<Tab> to insert a real tab
set expandtab

" Y yanks to end of line (removed from vim-sensible plugin for some reason)
noremap Y y$

" use the space bar as <leader> - easier to reach than \
map <Space> <Leader>

" <Leader>cd changes directory to location of current file
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" <Leader>z switches to previous buffer
noremap <leader>z :e#<CR>
" <Leader>b loads bufexplorer plugin
noremap <silent> <leader>b :BufExplorer<CR>
" disable default mappings so vim doesn't wait to see if <Leader>b[x] is going to be pressed
let g:bufExplorerDisableDefaultKeyMapping=1

"Filetype associations
" txx template files
" For some reason, both of the following lines are needed;
" The first to get YouCompleteMe to respect the filetype on some files, and
" the second to prevent txx files from being recongnized as conf type.  I
" don't understand exactly what is causing this, but this seems to work.
au BufNewFile,BufRead *.txx setfiletype cpp
au BufNewFile,BufRead *.txx set filetype=cpp

" autocomplete options
set wildmenu
set wildmode=longest:full

" smart search
set ignorecase
set smartcase

" turn on line numbers
set nu

" Colorscheme stuff
" uncomment the line below if your terminal is _not_ using the solarized color palette
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" use Ctrl+h,j,k,l to move between windows
:nmap <C-h> <C-w>h
:nmap <C-l> <C-w>l
:nmap <C-j> <C-w>j
:nmap <C-k> <C-w>k

" disable auto-commenting on subsequent lines
autocmd FileType c,cpp setlocal comments-=:// comments+=f://
" use 4 spaces of indent in python to conform with PEP8 standards
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" automatically populate vim's location list with errors
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if !has('win32')
  " more YCM options
  "let g:ycm_autoclose_preview_window_after_completion = 1
  "let g:ycm_autoclose_preview_window_after_insertion = 1
  " goto definition using YouCompleteMe plugin
  nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
endif

" use the pylint and pep8 checkers for python code
let g:syntastic_python_checkers = ['flake8']
" ignore pep8 warnings:
" E501: lines over 80 characters
" E201: whitespace after '('
" E202: whitespace before ')'
" E221: missing whitespace around operator
" E225: missing whitespace around operator
" E226: missing whitespace around operator
" E227: missing whitespace around operator
" E228: missing whitespace around operator
" E231: msising whitespace after ','
" W391: blank lines at eof
let g:syntastic_python_flake8_post_args = '--ignore=E501,E201,E202,E221,E225,E226,E227,E228,E231,W391'

let g:alternateExtensions_h = "c,cpp,cxx,txx,hpp,hxx,C,CPP,CXX,TXX,HPP,HXX"
let g:alternateExtensions_H = "c,cpp,cxx,txx,hpp,hxx,C,CPP,CXX,TXX,HPP,HXX"
let g:alternateExtensions_txx = "h,H"
let g:alternateExtensions_TXX = "h,H"
let g:alternateExtensions_hxx = "h,H"
let g:alternateExtensions_HXX = "h,H"

" fuzzy file searching via ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" <Leader>p shortcut
nnoremap <Leader>p <C-p>
" use nearest ancestor containing .git file, or cwd
let g:ctrlp_working_path_mode = 'ra'

" use the silver searcher if available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" persist undo information
set undofile
set undodir=~/.vim/undo

" mapping for Mundo plugin
nnoremap <Leader>u :MundoToggle<CR>

" EasyMotion mapping
map <Leader> <Plug>(easymotion-prefix)

" tell vim about italics code.
set t_ZH=[3m
set t_ZR=[23m

" comments look nice in italics
highlight Comment cterm=italic

" spell checking
set spell spelllang=en_us

" filename *.md  => markdown filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" shortcut to save
nnoremap <Leader>w :w<CR>

" leave rainbow parens off by default, enable with <Leader>r
let g:rainbow_active=0
nnoremap <Leader>r :RainbowToggle<CR>

" shortcut for make
nnoremap <Leader>m :make!<CR>

" powerline fonts only working on mac
if has('mac')
  let g:airline_powerline_fonts = 1
else
  let g:airline_powerline_fonts = 0
endif

" Use Escape to exit terminal mode (neovim only)
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
