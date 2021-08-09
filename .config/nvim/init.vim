call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/ap/vim-css-color.git'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdtree' 

Plug 'ryanoasis/vim-devicons'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'

Plug 'morhetz/gruvbox'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'preservim/nerdcommenter'

Plug 'sbdchd/neoformat'

Plug 'baskerville/vim-sxhkdrc'

Plug 'flazz/vim-colorschemes'

Plug 'tpope/vim-fugitive'

Plug 'fratajczak/one-monokai-vim'
call plug#end()

"Basic config
set background=light
imap jj <Esc>
syntax on
filetype plugin on
set number rnu
set splitright splitbelow

autocmd BufEnter *.js colorscheme gruvbox | set background=dark
autocmd BufEnter *.html colorscheme gruvbox | set background=dark
autocmd BufEnter *.css colorscheme gruvbox | set background=dark

let g:airline_theme='simple'

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Copy to sys Clipboard
vnoremap <C-c> "+y

"NERDTREE 
nnoremap <C-space> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusUseNerdFonts = 1 
" Exit Vim if NERDTree is the only window left.  
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"NERDCommenter
vmap / <plug>NERDCommenterToggle

"CoC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <F2> <Plug>(coc-rename)

let g:coc_global_extensions = [
 \ 'coc-html',
 \ 'coc-css',
 \ 'coc-tsserver',
 \ 'coc-git',
 \ 'coc-json', 
 \ 'coc-java'
 \ ]

"Prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"autocmd BufWritePre *.js Neoformat
"autocmd BufWritePre *.css Neoformat

"CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"AutoCmds
autocmd BufWritePost ~/.config/x11/Xresources !xrdb %

autocmd BufWritePost *.tex !pdflatex % 

"autocmd BufWritePost *.java !java % 

autocmd BufWritePost sxhkdrc !pkill sxhkd 

autocmd BufEnter blocks.h silent! lcd %:p:h 

autocmd BufWritePost blocks.h !sudo make install && pkill dwmblocks

"Snippets
autocmd FileType java inoremap psvm public static void main(String[] args) { <Enter><Enter> }<Esc>ki
		
autocmd FileType java inoremap sout System.out.println();<Esc>hi

"Terminal
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
