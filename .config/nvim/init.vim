call plug#begin('~/.config/nvim/plugged')
"Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'LexFrench/molokai-transparent'
Plug 'Mofiqul/vscode.nvim'
"Code
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree' 
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
" Syntax
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'uiiaoo/java-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
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
set background=dark
set termguicolors

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


" GRUVBOX 
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'original'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_ui_contrast = 'high'
let g:gruvbox_material_diagnostic_text_highlight = 1
"let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_theme='gruvbox_material'
colorscheme gruvbox-material

" MOLOKAI
let g:molokai_transparent = 1
let g:molokai_alternate_comments = 1
"let g:airline_theme='simple'
"colorscheme molokaiTransparent

"VSCODE
let g:vscode_transparent = 1
let g:vscode_italic_comment = 1
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
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"NERDCommenter
vmap / <plug>NERDCommenterToggle

"CoC
nmap <F2> <Plug>(coc-rename)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:coc_global_extensions = [
 \ 'coc-html',
 \ 'coc-css',
 \ 'coc-tsserver',
 \ 'coc-json', 
 \ 'coc-angular',
 \ 'coc-eslint',
 \ 'coc-git',
 \ 'coc-java'
 \ ]
 "\ 'coc-clangd',


"CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"AutoCmds

"autocmd BufWritePost *.java !java % 

autocmd BufEnter *.java map <leader>i :CocCommand java.action.organizeImports<CR>

autocmd BufEnter *.js map <leader>i :CocCommand tsserver.executeAutofix<CR>
autocmd BufEnter *.ts map <leader>i :CocCommand tsserver.executeAutofix<CR>

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
