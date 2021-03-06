call plug#begin()

" Plug 'flazz/vim-colorschemes'

Plug 'tssm/fairyfloss.vim'

Plug 'adelarsq/vim-grimmjow'

Plug 'lifepillar/vim-gruvbox8'

Plug 'ayu-theme/ayu-vim'

Plug 'lervag/vimtex'

" Plug 'vimlab/split-term.vim'

Plug 'tpope/vim-fireplace', { 'for' : 'clojure' }

Plug 'preservim/nerdtree'

Plug 'ervandew/supertab'

Plug 'tpope/vim-commentary'

Plug 'AndrewRadev/bufferize.vim'

Plug 'tpope/vim-fugitive'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'dbakker/vim-projectroot'

Plug 'dag/vim-fish'

call plug#end()

let g:tex_flavor = "latex"

set guifont=Menlo:h18
set guioptions=

function! ToggleCul()
    set cul! 
    redraw
endfunction

autocmd InsertEnter,InsertLeave * call ToggleCul()

tnoremap <Esc> <C-\><C-n>

set ruler
set nocompatible
set ff=unix

" let g:asyncomplete_auto_popup=0
" inoremap <expr> <C-p>   pumvisible() ? "\<C-n>" : "\<Tab>"

filetype plugin on
set omnifunc=syntaxcomplete#Complete

filetype indent plugin on
syntax on

set incsearch
set hlsearch
set number relativenumber
set cursorline
set nowrap
set termguicolors

set nofoldenable
set foldmethod=indent

set mouse=a

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set wildmenu

let g:SuperTabDefaultCompletionType='<c-x><c-o>'
autocmd CompleteDone * pclose

if system('date +%H') >= 17
    set background=dark
else
    set background=light
endif

" " colorscheme gotham256
" colorscheme xcode

colorscheme fairyfloss

nmap <silent> -w :w<CR>

" Commenting using vim-commentary
nmap <silent> ; gccj
vmap <silent> ; gc 

nmap <silent> -n :noh<CR>

" set clipboard+=unnamedplus
nmap <silent> -p "+p
vmap <silent> -y "+y

let mapleader = " "
set backspace=indent,eol,start

nmap <silent> -- zA
nmap <silent> -ec :tabnew ~/.vim/vimrc<CR>

nnoremap <silent> -T :term ++rows=10 fish<CR>

function! TexMode()
    set wrap
    nnoremap <Down> gj
    nnoremap <Up> gk
    vnoremap <Down> gj
    vnoremap <Up> gk
    inoremap <Down> <C-o>gj
    inoremap <Up> <C-o>gk
    inoremap <Home> <C-o>g<Home>
    inoremap <End>  <C-o>g<End>
endfunction

function! TexModeOff()
    set nowrap
    nnoremap <Down> <Down>
    nnoremap <Up> <Up>
    vnoremap <Down> <Down>
    vnoremap <Up> <Up>
    inoremap <Down> <Down>
    inoremap <Up> <Up>
    inoremap <Home> <Home>
    inoremap <End> <End>
endfunction

nmap <silent> -tex :call TexMode()<CR>
nmap <silent> -oth :call TexModeOff()<CR>
nmap <silent> <leader>1 1gt
nmap <silent> <leader>2 2gt
nmap <silent> <leader>3 3gt
nmap <silent> <leader>4 4gt

" let g:lsp_semantic_enabled=1
" let g:lsp_diagnostics_echo_cursor = 1
" nmap <silent> <leader>= :LspHover<CR>
" nmap <silent> <leader>-i :tab LspImplementation<CR>
" nmap <silent> <leader>] :LspNextError<CR>
" nmap <silent> <leader>[ :LspPreviousError<CR>
" nmap <silent> <leader>; :LspNextWarning<CR>
" nmap <silent> <leader>' :LspPreviousWarning<CR>


nmap <silent> -d :ProjectRootExe NERDTreeToggle<CR>

nmap <silent> -am :Bufferize messages<CR>

nmap <silent> -eb :%Eval<CR>
vmap -ee :Eval<CR>
nmap -ee :Eval<CR>

" xnoremap "+y y:call system("wl-copy", @")<cr>
" nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
" nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

function! NewFile() 
    call inputsave()
    let l:fn = input("Tab file [<CR> to cancel] ? ", "", "file")
    call inputrestore()
    if l:fn == ""
        echo "Cancelled"
    else 
        let l:cmd = "tabnew ".l:fn
        call execute(l:cmd)
    endif 
endfunction 

nmap <silent> <leader>t :call NewFile()<CR>


" set runtimepath+=/home/mbrc/dev/supersede
