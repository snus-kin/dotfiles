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

" Tabs
set expandtab
set tabstop=2
set shiftwidth=4

set hidden
set splitbelow
set splitright


" Clip Board
set clipboard=unnamed

" -----------------------------------
"
" Key Mappings
"
" -----------------------------------
let mapleader='\'

" open files that don't exist
map gf :edit <cfile><cr>

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

" Tests
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

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
    Plug 'tpope/vim-commentary'
    Plug 'triglav/vim-visual-increment'
    Plug 'lervag/vimtex', { 'for': ['tex', 'plaintex'] }
    Plug 'matze/vim-tex-fold', { 'for': ['tex', 'plaintex'] }
    Plug 'rhysd/vim-grammarous'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'Valloric/YouCompleteMe'
    Plug 'alaviss/nim.nvim', { 'for': 'nim' }
    Plug 'reedes/vim-wordy'
    Plug 'morhetz/gruvbox'
    Plug 'w0rp/ale'
    Plug 'vim-scripts/utl.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-scripts/SyntaxRange'
    Plug 'tmhedberg/SimpylFold'
    Plug 'tpope/vim-fugitive'
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    Plug 'sophacles/vim-processing', { 'for': 'processing' }
    Plug 'bfrg/vim-cpp-modern', { 'for': 'cpp' }
    Plug 'funorpain/vim-cpplint', { 'for': 'cpp' }
    Plug 'snus-kin/p9.vim'
    Plug 'soli/prolog-vim'
    Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Colour Scheme
let g:gruvbox_contrast_dark = "hard"
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" vimtex vew and compile
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_progname = 'nvr'

"YCM settings
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0

let g:tex_flavor = "latex"

" ALE settings
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {'tex': ['proselint'], 'markdown': ['proselint'], 'python': ['pylint'], 'javascript': ['prettier']}
let g:ale_sign_error = '>>'
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1

" vertical line indentation
let g:indentLine_char = '│'

" Don't conceal characters with indentLine plugin
let g:indentLine_setConceal = 0

let test#python#runner = 'nose'
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
