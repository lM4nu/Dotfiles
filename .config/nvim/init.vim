call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/ap/vim-css-color.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree' 
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sainnhe/gruvbox-material'
Plug 'LexFrench/molokai-transparent'
Plug 'Mofiqul/vscode.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'VebbNix/lf-vim'
Plug 'baskerville/vim-sxhkdrc'

call plug#end()

"command Gcc :silent w | !set $1 `echo "%" | sed 's/\.c//g'` ; gcc -o $1 "%" && ./$1
command Gcc :silent w | :terminal set $1 `echo "%" | sed 's/\.c//g'` ; gcc -o $1 "%" && ./$1


"Basic config
"set background=light
let mapleader =","
imap jj <Esc>
syntax on
set clipboard+=unnamedplus
filetype plugin on
set title
set ignorecase
set number rnu
set splitright splitbelow

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" GRUVBOX 
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_ui_contrast = 'high'
let g:airline_theme='base16_gruvbox_dark_hard'
set background=dark
colorscheme gruvbox-material

" MOLOKAI
"let g:molokai_transparent = 1
"let g:molokai_alternate_comments = 1
"let g:airline_theme='simple'
"colorscheme molokaiTransparent

"VSCODE
"set background=dark
"let g:vscode_transparent = 1
"let g:vscode_italic_comment = 1
"let g:airline_theme='simple'
"colorscheme vscode
"
"Mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>s :setlocal spell! spelllang=es<CR>
map <leader>S :setlocal spell! spelllang=en_us<CR>
map <leader>c :w! \| :silent !compiler "<c-r>%"<CR>
map <leader>p :!opout <c-r>%<CR><CR>

"Copy to sys Clipboard
"vnoremap <C-c> "+y
"map <C-y> "+P

"NERDTREE 
nnoremap <leader><space> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusUseNerdFonts = 1 
" Exit Vim if NERDTree is the only window left.  
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"NERDCommenter
vmap / <plug>NERDCommenterToggle

"CoC
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <F2> <Plug>(coc-rename)

let g:coc_global_extensions = [
 \ 'coc-html',
 \ 'coc-css',
 \ 'coc-tsserver',
 \ 'coc-git',
 \ 'coc-json', 
 \ 'coc-java'
 \ ]
 "\ 'coc-clangd',


"CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"AutoCmds

"autocmd BufWritePost *.java !java % 

autocmd BufEnter blocks.h silent! lcd %:p:h 

autocmd BufWritePost blocks.h !sudo make install && pkill dwmblocks && setsid -f dwmblocks

autocmd BufEnter user-overrides.js silent! lcd %:p:h 

autocmd BufWritePost user-overrides.js !./updater.sh -s && ./prefsCleaner.sh -s

autocmd BufEnter aliasrc set filetype=sh

autocmd BufEnter icons set filetype=sh

autocmd BufWritePost dunstrc :silent !pkill dunst && setsid -f dunst

autocmd BufWritePost sxhkdrc :silent !pkill -10 sxhkd

autocmd BufWritePost ~/.config/x11/Xresources !xrdb %

"Snippets
autocmd FileType java inoremap psvm public static void main(String[] args) { <Enter><Enter> }<Esc>ki
		
autocmd FileType java inoremap sout System.out.println();<Esc>hi

"Terminal
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
