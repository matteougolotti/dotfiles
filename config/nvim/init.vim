set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

call plug#begin('~/.vim/plugged')

" Haskell
""Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': 'hasell'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

" Nerdtree
Plug 'preservim/nerdtree'

" Python
" Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Misc
Plug 'Valloric/YouCompleteMe', {'for': 'rust'}
Plug 'numkil/ag.nvim'

" VimCode
Plug 'tomasiser/vim-code-dark'

call plug#end()

colorscheme codedark

set hidden
set number

set listchars=tab:→\
set list

" Flake8
autocmd BufWritePost *.py call Flake8()

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
