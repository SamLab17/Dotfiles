" VimPlug Package Manager
call plug#begin(stdpath('data') . '/plugged')

Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'rhysd/vim-clang-format'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'

" Color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'

call plug#end()

" Colorscheme

" colorscheme gruvbox
colorscheme nord 

" Undo after quit
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/undo
endif

" 256 Color mode
set termguicolors

" Puts a vertical line at column 81
set colorcolumn=81

" Hybrid line numbers
set number relativenumber
set nu rnu

" Enable syntax highlighting
syntax enable
" Show tab characters
set list
set listchars=tab:\|\ 
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent

" Binds Escape to exit Terminal mode
tnoremap <Esc> <C-\><C-n>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" To come back from defintion, use Ctrl-O, Ctrl-I goes forwards again

" Map Control-N to open Nerdtree file browser
map <C-n> :NERDTreeToggle<CR>
" Map Control-/ to toggle comment on a line (in Normal Mode)
map <C-_> <plug>NERDCommenterToggle
" Use ENTER in normal mode to toggle distraction-free mode
map <ENTER> :Goyo<CR>

" Resize splits using the arrow keys
" nnoremap <Down> :resize +2<CR>
" nnoremap <Up> :resize -2<CR>
" nnoremap <Right> :vertical resize +2<CR>
" nnoremap <Left> :vertical resize -2<CR>

" vim-clang-format Configuration
" Look for a .clang-format file in the directory
let g:clang_format#detect_style_file=1
" If the format file is not found, do nothing
let g:clang_format#enable_fallback_style=0
" Format the file when saving the buffer
let g:clang_format#auto_format=1

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:tex_flavor='latex'
let g:vimtex_view_method= 'zathura'
let g:vimtex_compiler_progname= 'nvr'
let g:vimtex_quickfix_mode=0
let g:conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_view_forward_search_on_start=0

let g:polyglot_disabled = ['latex']

