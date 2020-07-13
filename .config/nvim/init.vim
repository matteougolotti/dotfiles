set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

call plug#begin('~/.vim/plugged')

" Haskell
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': 'hasell'}
Plug 'neovimhaskell/haskell-vim'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Misc
Plug 'Valloric/YouCompleteMe', {'for': 'rust'}
Plug 'numkil/ag.nvim'


call plug#end()

set hidden

" Flake8
autocmd BufWritePost *.py call Flake8()
