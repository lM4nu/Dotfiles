call plug#begin('~/.config/nvim/plugged')
"Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'LexFrench/molokai-transparent'
Plug 'Mofiqul/vscode.nvim'
"Plug 'bling/vim-bufferline'
"Code
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree' 
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
"Plug 'prettier/vim-prettier'
" Syntax
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'uiiaoo/java-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'VebbNix/lf-vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'digitaltoad/vim-pug'
Plug 'theRealCarneiro/hyprland-vim-syntax'
" .NET
Plug 'OmniSharp/omnisharp-vim'
Plug 'jlcrochet/vim-razor'

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

let g:netrw_browsex_viewer= "linkhandler"

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

nmap r'a rá
nmap r'A rÁ
nmap r'e ré
nmap r'E rÉ
nmap r'i rí
nmap r'I rÍ
nmap r'o ró
nmap r'O rÓ
nmap r'u rú
nmap r'U rÚ
nmap r'n rñ
nmap r'N rÑ

"Copy to sys Clipboard
"vnoremap <C-c> "+y
"map <C-y> "+P

"NERDTREE 
nnoremap <leader><space> :silent! NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusUseNerdFonts = 1 
" Exit Vim if NERDTree is the only window left.  
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"NERDCommenter
vmap / <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

"Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

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
"Scroll Documentation
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

let g:coc_global_extensions = [
 \ 'coc-html',
 \ 'coc-css',
 \ 'coc-tsserver',
 \ 'coc-json', 
 \ 'coc-java',
 \ 'coc-git',
 \ 'coc-prettier',
 \ 'coc-clangd'
 \ ]
 "\ 'coc-pairs'
 "\ 'coc-clangd',

"AutoPairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", "<":">"}

"CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"AutoCmds

"autocmd BufWritePost *.java !java % 

autocmd BufEnter *.java map <leader>i :CocCommand java.action.organizeImports<CR>

autocmd BufEnter *.js map <leader>i :CocCommand tsserver.executeAutofix<CR>
autocmd BufEnter *.ts map <leader>i :CocCommand tsserver.executeAutofix<CR>

autocmd BufEnter *.md imap 'a á
autocmd BufEnter *.md imap 'A Á
autocmd BufEnter *.md imap 'e é
autocmd BufEnter *.md imap 'E É
autocmd BufEnter *.md imap 'i í
autocmd BufEnter *.md imap 'I Í
autocmd BufEnter *.md imap 'o ó
autocmd BufEnter *.md imap 'O Ó
autocmd BufEnter *.md imap 'u ú
autocmd BufEnter *.md imap 'U Ú
autocmd BufEnter *.md imap 'n ñ
autocmd BufEnter *.md imap 'N Ñ

"autocmd BufEnter *.md nmap r'a rá
"autocmd BufEnter *.md nmap r'A rÁ
"autocmd BufEnter *.md nmap r'e ré
"autocmd BufEnter *.md nmap r'E rÉ
"autocmd BufEnter *.md nmap r'i rí
"autocmd BufEnter *.md nmap r'I rÍ
"autocmd BufEnter *.md nmap r'o ró
"autocmd BufEnter *.md nmap r'O rÓ
"autocmd BufEnter *.md nmap r'u rú
"autocmd BufEnter *.md nmap r'U rÚ

autocmd BufEnter blocks.h silent! lcd %:p:h 

autocmd BufWritePost blocks.h !sudo make install && pkill dwmblocks && setsid -f dwmblocks

autocmd BufWritePost ~/.config/waybar/style.css :silent !killall -SIGUSR2 waybar
autocmd BufWritePost ~/.config/waybar/config :silent !pkill waybar && setsid -f waybar &
autocmd BufWritePost ~/.config/hypr/hyprland.conf :silent !hypctl reload

autocmd BufEnter user-overrides.js silent! lcd %:p:h 

autocmd BufWritePost user-overrides.js !./updater.sh -s && ./prefsCleaner.sh -s

autocmd BufEnter icons set filetype=sh

autocmd BufWritePost dunstrc :silent !pkill dunst && setsid -f dunst

autocmd BufWritePost sxhkdrc :silent !pkill -10 sxhkd

autocmd BufWritePost ~/.config/x11/Xresources !xrdb %

"Snippets
autocmd FileType java inoremap psvm public static void main(String[] args) { <Enter><Enter> }<Esc>ki
		
autocmd FileType java inoremap sout System.out.println();<Esc>hi

autocmd BufEnter *.js inoremap CL console.log();<Esc>hi
autocmd BufEnter *.js :set shiftwidth=2

autocmd BufEnter *.ts inoremap CL console.log();<Esc>hi
autocmd BufEnter *.ts :set shiftwidth=2

autocmd BufEnter *.pug :set shiftwidth=2 expandtab

"Terminal
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
