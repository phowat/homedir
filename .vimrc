call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'
Plug 'arcticicestudio/nord-vim'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'blindFS/vim-taskwarrior'
Plug 'dodie/vim-disapprove-deep-indentation'
Plug 'ipoddubny/asterisk-vim'
Plug 'davidhalter/jedi-vim'
Plug 'tomlion/vim-solidity'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/Marks-Browser'
Plug 'tomtom/tcomment_vim'
call plug#end()

:set noscb
:set hidden
:set ignorecase
:set smartcase 
:set incsearch
:set nowrapscan
:set autoindent
:set nonumber
:set hlsearch
:set nocompatible
filetype indent on
filetype on
filetype plugin on
autocmd BufRead,BufNewFile *.ep set filetype=html
autocmd BufRead,BufNewFile *.conf set filetype=dosini
autocmd FileType python,rst set sw=4 ts=4 sts=4 tw=79 expandtab smarttab
autocmd FileType ruby set sw=2 ts=2 sts=2 tw=79 expandtab smarttab
autocmd FileType php set sw=4 ts=4 sts=4 smarttab
autocmd FileType html set sw=2 ts=2 sts=2 expandtab smarttab
autocmd FileType javascript set sw=4 ts=4 sts=4 tw=99 expandtab smarttab
autocmd FileType perl set sw=2 ts=2 sts=2 tw=99 expandtab smarttab
autocmd FileType sql set sw=2 ts=2 sts=2 expandtab smarttab
autocmd FileType c,cpp set sw=4 ts=4 sts=4 tw=99 smarttab cindent
autocmd FileType rust,rs set sw=4 ts=4 sts=4 tw=99 expandtab smarttab
autocmd FileType coffee set sw=4 ts=4 sts=4 expandtab smarttab
autocmd FileType lisp set sw=2 ts=2 sts=2 expandtab smarttab
" autocmd FileType python,rst,php match ErrorMsg '\%>79v.\+'
autocmd FileType python,rst match ErrorMsg '\%>79v.\+'
autocmd FileType perl,javascript,rust,rs match ErrorMsg '\%>99v.\+'
autocmd filetype c nnoremap <F4> :w <bar> exec '!make' <CR>
autocmd filetype c nnoremap <F5> :w <bar> exec '!sudo make install' <CR>
:nnoremap gt :bnext<CR>
:nnoremap gT :bprevious<CR>
:map <F2> :NERDTreeToggle<cr> 
:map <c-x> :NERDTreeToggle<cr> 
:map <m-x> :MarksBrowser<cr> 
:map <m-t> :CtrlP<cr>
:map fr \be
:syntax on
":set background=dark
":hi Normal ctermbg=None
:set hlsearch
:set backspace=indent,eol,start
:set ruler

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Keybindings for λ and ƒ
:inoremap <A-l> <C-v>u3bb<Space>
:inoremap <A-f> <C-v>u192<Space>

"let g:Perl_DirectRun='yes'
let g:Perl_Perl='/home/pedro/perl5/perlbrew/perls/perl-5.18.2/bin/perl'

autocmd FileType lisp RainbowParenthesesToggle

colorscheme nord
let g:airline#extensions#tabline#enabled = 1

nmap <F8> :TagbarToggle<CR>
let g:task_rc_override = 'rc.defaultwidth=0'
