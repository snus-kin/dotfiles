" -----------------------------------
"
" Base vim
"
" -----------------------------------
syntax on
set visualbell
set number
set relativenumber
set linebreak
set ruler
set showmatch
set hlsearch
set ignorecase
set autoindent
set smartindent
set smarttab

set list
set listchars=tab:▸\ ,trail:·

set expandtab
set tabstop=2
set shiftwidth=4

set hidden
set splitbelow
set splitright

set clipboard=unnamed

" -----------------------------------
"
" Key Mappings
"
" -----------------------------------
let mapleader='\'

" open files that don't exist
map gf :sp <cfile><cr>

" reselect after indentation
vnoremap < <gv
vnoremap > >gv

" Better window movements
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" unfold on space
nnoremap <space> za

" Open nerd tree
nmap <F6> :NERDTreeToggle<CR>

" Map terminal mode escape sanely
tnoremap <Esc> <C-\><C-n>

" jk to escape (faster?)
inoremap jk <esc>

" fuzzy find on control p
nnoremap <silent> <C-p> :FZF<CR>
" -----------------------------------
"
" Plugins
"
" -----------------------------------
call plug#begin('~/.local/share/nvim/plugged')
    source ~/.config/nvim/plugin/simpylfold.vim
    source ~/.config/nvim/plugin/youcompleteme.vim
    source ~/.config/nvim/plugin/ale.vim
    source ~/.config/nvim/plugin/commentary.vim
    source ~/.config/nvim/plugin/editorconfig.vim
    source ~/.config/nvim/plugin/fugitive.vim
    source ~/.config/nvim/plugin/fzf.vim
    source ~/.config/nvim/plugin/grammarous.vim
    source ~/.config/nvim/plugin/gruvbox.vim
    source ~/.config/nvim/plugin/indentLine.vim
    source ~/.config/nvim/plugin/nerdtree.vim
    source ~/.config/nvim/plugin/nim.vim
    source ~/.config/nvim/plugin/p9.vim
    source ~/.config/nvim/plugin/polyglot.vim
    source ~/.config/nvim/plugin/prolog.vim
    source ~/.config/nvim/plugin/python-mode.vim
    source ~/.config/nvim/plugin/surround.vim
    source ~/.config/nvim/plugin/test.vim
    source ~/.config/nvim/plugin/tex.vim
    source ~/.config/nvim/plugin/text-fold.vim
    source ~/.config/nvim/plugin/utl.vim
    source ~/.config/nvim/plugin/visual-increment.vim
    source ~/.config/nvim/plugin/wordy.vim
call plug#end()

" -----------------------------------
"
" Filetypes
"
" -----------------------------------

" When editing text-based files, keep text width to 80
autocmd Filetype markdown setlocal tw=80
autocmd Filetype markdown setlocal spell spelllang=en_gb
autocmd Filetype tex setlocal tw=80
autocmd Filetype tex setlocal spell spelllang=en_gb

" gq does autopep8 in python files
au FileType python setlocal formatprg=autopep8\ -
