let mapleader=","
let g:plugged_home = '~/.vim/plugged'

filetype on " Must be turned on for some pluggins

" Plugins List
call plug#begin(g:plugged_home)
  Plug 'davidhalter/jedi-vim'
  Plug 'ervandew/supertab'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
  Plug 'ap/vim-buftabline'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'majutsushi/tagbar'
call plug#end()

filetype plugin indent on

" Configurations Part
" UI configuration
syntax on
syntax enable


" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

nnoremap <silent> <leader>n :NERDTreeToggle<Enter>

let g:SuperTabMappingBackward = "<silent> <tab>"
let g:SuperTabMappingForward = "<silent> <s-tab>"

let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<silent> <leader>d"
let g:jedi#goto_assignments_command = "<silent> <leader>g"
let g:jedi#goto_definitions_command = "<silent> <leader>b"
let g:jedi#documentation_command = "<silent> <leader>q"
let g:jedi#usages_command = "<silent> <leader>u"
let g:jedi#completions_command = "<silent> <C-Space>"
let g:jedi#rename_command = "<silent> <leader>r"

nnoremap <silent> <leader>t :TagbarToggle<CR>

nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>ft :Tags<CR>

nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprev<CR>
nnoremap <silent> <leader>c :bd<CR>

nmap <silent> <leader>m :set invnumber<CR>

set splitbelow
set splitright
nmap <silent> <c-w>\| :vs<CR>
nmap <silent> <c-w>- :sp<CR>

set pastetoggle=<leader>p
