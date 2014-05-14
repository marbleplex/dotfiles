" endoding: utf-8
" Japanese
set enc=utf-8
set fenc=utf-8
" set fencs=cp932,euc-jp,iso-2022-jp
set fileformats=unix,mac,dos

" tab width
set ts=4
set et

" search
set ignorecase
set smartcase
set incsearch

filetype on
set notitle
colorscheme ron

"Ruby
autocmd FileType ruby,eruby set ts=2 sw=2 sts=2 expandtab nonumber fenc=utf-8
syntax on
filetype indent on
filetype plugin on

" transcoding charset
" http://itcweb.cc.affrc.go.jp/affrit/faq/tips/vim-enc
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\

" visualize control characters
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 全角スペース・行末のスペース・タブの可視化
" if has("syntax")
"    syntax on
"  PODバグ対策
"    syn sync fromstart
" end if


" binary editor mode
" http://d.hatena.ne.jp/rdera/20081022/1224682665
" vim -b [file] will open anyfile in binary mode

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre   *.bin let &binary =1
  autocmd BufReadPost  * if &binary | silent %!xxd -g 1
  autocmd BufReadPost  * set ft=xxd | endif
  autocmd BufWritePre  * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

augroup BinaryXXD
" 全角スペース・行末のスペース・タブの可視化
" if has("syntax")
"     syntax on
"  
"     " PODバグ対策
"     syn sync fromstart
"  
"     function! ActivateInvisibleIndicator()
"         " 下の行の"　"は全角スペース
"         syntax match InvisibleJISX0208Space "　" display containedin=ALL
"         highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
"         "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
"         "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
"         "syntax match InvisibleTab "\t" display containedin=ALL
"         "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
"     endfunction
"  
"     augroup invisible
"         autocmd! invisible
"         autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
"     augroup END
" endif
" http://d.hatena.ne.jp/studio-m/20080117/
" highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
" au BufRead,BufNew * match JpSpace /　/
