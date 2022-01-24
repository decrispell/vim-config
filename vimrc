set encoding=utf-8
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
" language syntax
Plug 'sheerun/vim-polyglot'
" fugitive for git integration
Plug 'tpope/vim-fugitive'
" Ctrl-P for fuzzy file searching
Plug 'kien/ctrlp.vim'
" undo tree traversal
Plug 'mbbill/undotree'
" lightweight status bar
Plug 'vim-airline/vim-airline'
" themes for airline
Plug 'vim-airline/vim-airline-themes'
" lightweight file manager settings
Plug 'tpope/vim-vinegar'
" explore open buffers
Plug 'jlanzarotta/bufexplorer'
" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" don't jump to next occurence when using star search
Plug 'vim-scripts/star-search'
" OSC 52 functionality for accessing clipboard
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

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
" let g:solarized_termcolors=256
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

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


let g:alternateExtensions_h = "c,cc,cpp,cxx,txx,hpp,hxx,C,CC,CPP,CXX,TXX,HPP,HXX"
let g:alternateExtensions_H = "c,cc,cpp,cxx,txx,hpp,hxx,C,CC,CPP,CXX,TXX,HPP,HXX"
let g:alternateExtensions_txx = "h,H"
let g:alternateExtensions_TXX = "h,H"
let g:alternateExtensions_hxx = "h,H"
let g:alternateExtensions_HXX = "h,H"

" highlight and jump between matching angle brackets.
" This is especially useful for heavily templated C++
set matchpairs+=<:>

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

" Ctrl-c to copy to system clipboard via OSC 52
vnoremap <C-c> :OSCYank<CR>

" Use Escape to exit terminal mode (neovim only)
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
