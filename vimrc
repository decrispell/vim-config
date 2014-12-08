" location of vim-config git repository
let vimconfigdir = $HOME . "/vim-config"
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
if has("win32")
  " disable windows-specific stuff here
  call add(g:pathogen_disabled, 'YouCompleteMe')
endif
" use YouCompleteMe instead of clang_complete
call add(g:pathogen_disabled, 'clang_complete')

"load plugins in the "bundle" directory via pathogen
execute pathogen#infect()
"enable syntax highlighting
syntax on
"turn on smart indenting
filetype plugin indent on
"align function arguments on next line with previous args
set cino=(0

"highlight search things
set hlsearch 

"set tab width
set tabstop=2
set shiftwidth=2
" insert spaces in place of <tab> - use CTRL-V<Tab> to insert a real tab
set expandtab

" Y yanks to end of line (removed from vim-sensible plugin for some reason)
noremap Y y$

" use the comma key as <leader> - easier to reach than \
let mapleader = ","
" ,cd changes directory to location of current file
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" ,z switches to previous buffer
noremap <leader>z :e#<CR>
" ,b loads bufexplorer plugin
noremap <silent> <leader>b :BufExplorer<CR>

"Filetype associations
" txx template files
au BufNewFile,BufRead *.txx set filetype=cpp

" autocomplete options
set wildmenu
set wildmode=longest:full

" smart search
set ignorecase
set smartcase

" turn on line numbers
set nu

" set color scheme: .gvimrc should override for gvim
"set t_Co=256
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
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

" the clang_complete plugin is disabled in favor of YouCompleteMe,
" but its .clang_complete config files are useful for syntastic and YCM.
" obtain include paths for syntastic from the .clang_complete files
let g:syntastic_c_config_file='.clang_complete'
let g:syntastic_cpp_config_file='.clang_complete'
" automatically populate vim's location list with errors
let g:syntastic_always_populate_loc_list=1
" python module to load include paths from .clang_complete files for YCM
" there has got to be a better way to use variables..
execute "let g:ycm_global_ycm_extra_conf='".vimconfigdir."/scripts/ycm_use_clang_complete.py"."'"
" more YCM options
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" goto definition using YouCompleteMe plugin
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" use the pylint and pep8 checkers for python code
let g:syntastic_python_checkers = ['pylint','pep8']
" ignore pylint warnings:
" C0301: line length over 80 characters
" C0103: invalid variable names
" R0193: too many function arguments
" R0912: too many branches
" R0914: too many local variables
" R0915: too many statements
" C0324: comma not followed by space
" C0321: multiple statements on single line
" C0325: superfluous parentheses ( gives annoying warning for 'print(..)' )
" W0142: used * or ** magic
let g:syntastic_python_pylint_post_args = '--disable=C0301,C0103,R0912,R0913,R0914,R0915,C0324,C0325,C0321,W0142'
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
let g:syntastic_python_pep8_post_args = '--ignore=E501,E201,E202,E221,E225,E226,E227,E228,E231,W391'

let g:alternateExtensions_h = "c,cpp,cxx,txx,hpp,C,CPP,CXX,TXX,HPP"
let g:alternateExtensions_H = "c,cpp,cxx,txx,hpp,C,CPP,CXX,TXX,HPP"
let g:alternateExtensions_txx = "h,H"
let g:alternateExtensions_TXX = "h,H"

" fuzzy file searching via ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" use directory of current file as starting point
let g:ctrlp_working_path_mode = 'a'

" use the silver searcher if available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" mapping for Gundo plugin
nnoremap <F2> :GundoToggle<CR>

