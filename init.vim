set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable 
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2

call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim', " OneDark Theme
Plug 'preservim/nerdtree', " Exploracion De Archivos
Plug 'vim-airline/vim-airline', " Barra de estado
Plug 'vim-airline/vim-airline-themes',  " Temas para airline
Plug 'Yggdroot/indentLine', " Lineas de indentacion
Plug 'xuyuanp/nerdtree-git-plugin', " Nerd tree git plugin
Plug 'jiangmiao/auto-pairs',
Plug 'alvan/vim-closetag',
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
call plug#end()

set termguicolors  " Activa true colors en la terminal
colorscheme onedark  " Activa tema onedark
let mapleader=" "
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual

" Plugins de busqueda
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',

" Sus comandos
nmap <C-r> :Rg<CR>

" Abrir/cerrar NERDTree con ctrl+t
nmap <C-t> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

nmap <C-w> :wq<CR> "Guardar y cerrar
nmap <C-q> :q!<CR> " Forzar cierre
nmap <C-s> :w<CR> " Guardar solamente