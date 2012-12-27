:set noscb
:set hidden
:set ignorecase
:set smartcase 
:set incsearch
:set nowrapscan
:set autoindent
:set nonumber
:set hlsearch
filetype indent on
filetype on
filetype plugin on
autocmd BufRead,BufNewFile *.ep set filetype=html
autocmd FileType python,rst set sw=4 ts=4 sts=4 tw=79 expandtab smarttab
autocmd FileType php set sw=4 ts=4 sts=4 tw=79 smarttab
autocmd FileType html set sw=2 ts=2 sts=2 expandtab smarttab
autocmd FileType javascript set sw=4 ts=4 sts=4 tw=99 expandtab smarttab
autocmd FileType perl set sw=4 ts=4 sts=4 tw=99 expandtab smarttab
autocmd FileType python,rst,php match ErrorMsg '\%>79v.\+'
autocmd FileType perl,javascript match ErrorMsg '\%>99v.\+'
:nnoremap gt :bnext<CR>
:nnoremap gT :bprevious<CR>
:map <F2> :NERDTreeToggle<cr> 
:map <c-x> :NERDTreeToggle<cr> 
:map fr \be
:syntax on
:set background=dark
colorscheme solarized
:hi Normal ctermbg=None
:set hlsearch
