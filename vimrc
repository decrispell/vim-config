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
colorscheme solarized
set background=dark

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
" R0914: too many local variables
" C0324: comma not followed by space
" C0321: multiple statements on single line
let g:syntastic_python_pylint_post_args = '--disable=C0301,C0103,R0914,C0324,C0321'
" ignore pep8 warnings:
" E501: lines over 80 characters
" W391: blank lines at eof
" E226: missing whitespace around arithmetic operator
" E201: whitespace after '('
" E202: whitespace before ')'
" E221: missing whitespace around operator
let g:syntastic_python_pep8_post_args = '--ignore=E501,W391,E226,E201,E202,E231'

