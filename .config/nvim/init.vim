set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set nohlsearch

set hidden
set nobackup
set nowritebackup

:set colorcolumn=100

call plug#begin('~/.vim/plugged')

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Airline themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tomasiser/vim-code-dark'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Js
" Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Pyhton
" Automatically detect virtualenv
Plug 'rafi/vim-venom', { 'for': 'python' }

" TypeScript
Plug 'leafgarland/typescript-vim'

" Solidity
Plug 'tomlion/vim-solidity'

" VimSpector
Plug 'puremourning/vimspector'

" Misc
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }                                                       
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'

call plug#end()

"set background=dark
set termguicolors
colorscheme codedark

" Airline theme
let g:airline_theme='codedark'

" Rust ctags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/

" START additional config for coc
set cmdheight=2
set updatetime=300
set shortmess+=c

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=no
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" END config for coc 

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Floaterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_toggle = '<F12>'

" VimSpector
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader> di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader> di <Plug>VimspectorBalloonEval
let g:vimspector_enable_mappings = 'HUMAN'
