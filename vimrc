call plug#begin()

Plug 'flazz/vim-colorschemes'

Plug 'adelarsq/vim-grimmjow'

Plug 'ayu-theme/ayu-vim'

Plug 'tpope/vim-fireplace', { 'for' : 'clojure' }

Plug 'preservim/nerdtree'

Plug 'ervandew/supertab'

Plug 'tpope/vim-commentary'

Plug 'AndrewRadev/bufferize.vim'

Plug 'tpope/vim-fugitive'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'dbakker/vim-projectroot'

call plug#end()

function! ToggleCul()
    set cul! 
    redraw
endfunction

autocmd InsertEnter,InsertLeave * call ToggleCul()

set ruler
set nocompatible
set ff=unix

" let g:asyncomplete_auto_popup=0
" inoremap <expr> <C-p>   pumvisible() ? "\<C-n>" : "\<Tab>"

filetype plugin on
set omnifunc=syntaxcomplete#Complete

filetype indent plugin on
syntax on

set number
set cursorline
set nowrap
set termguicolors

set foldmethod=indent

set mouse=a

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set wildmenu

let g:SuperTabDefaultCompletionType='<c-x><c-o>'
autocmd CompleteDone * pclose

" if system('date +%H') > 18
"     set background=dark
"     let ayucolor="mirage"
"     colorscheme ayu
" else
"     set background=light
"     colorscheme grimmjow
" endif

" " colorscheme gotham256
" colorscheme xcode

set background=dark
colorscheme gruvbox

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



nmap <silent> <leader>1 1gt
nmap <silent> <leader>2 2gt
nmap <silent> <leader>3 3gt
nmap <silent> <leader>4 4gt

let g:lsp_diagnostics_echo_cursor = 1
nmap <silent> <leader>= :LspHover<CR>
nmap <silent> <leader>-i :tab LspImplementation<CR>
nmap <silent> <leader>] :LspNextError<CR>
nmap <silent> <leader>[ :LspPreviousError<CR>
nmap <silent> <leader>; :LspNextWarning<CR>
nmap <silent> <leader>' :LspPreviousWarning<CR>


nmap <silent> -d :ProjectRootExe NERDTreeToggle<CR>

nmap <silent> -am :Bufferize messages<CR>

nmap <silent> -eb :%Eval<CR>
vmap <silent> -ee :Eval<CR>
nmap <silent> -ee :Eval<CR>

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

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
