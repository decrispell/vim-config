" Use YouCompleteMe for latex autocompletion (via Latex-Box)
let g:ycm_semantic_triggers = {
\  'tex'  : ['{'],
\ }

" override <Leader>m for latex docs
nnoremap <Leader>m :Latexmk<CR>

" compile latex asynchronously
let g:LatexBox_latexmk_async = 1
