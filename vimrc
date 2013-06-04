" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
if has("win32")
  " disable windows-specific stuff here
endif
" use YouCompleteMe instead of clang_complete
call add(g:pathogen_disabled, 'clang_complete')

"load plugins in the "bundle" directory via pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

"highlight search things
set hlsearch 

"set tab width
set tabstop=2
set shiftwidth=2
" insert spaces in place of <tab> - use CTRL-V<Tab> to insert a real tab
set expandtab

" ,cd changes directory to location of current file
noremap ,cd :cd %:p:h<CR>:pwd<CR>

" ,z switches to previous buffer
noremap ,z :e#<CR>
" ,b loads bufexplorer plugin
map ,b \be

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

" obtain include paths for syntastic from the .clang_complete files
let g:syntastic_c_config_file='.clang_complete'
let g:syntastic_cpp_config_file='.clang_complete'

" disable auto-commenting on subsequent lines
au FileType c,cpp setlocal comments-=:// comments+=f://

