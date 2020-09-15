let mapleader=","

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" :PlugInstall :PlugClean
call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
call plug#end()

filetype on
filetype plugin on

syntax enable

set tabstop=2
set softtabstop=3
set shiftwidth=2
set autoindent
set expandtab
let g:tagbar_ctags_bin="$HOME/.local/bin/ctags"

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

au FileType python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 autoindent "smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldmethod=indent foldlevel=99

nnoremap <silent> <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<Enter>

nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprev<CR>
nnoremap <silent> <C-j> :tabp<CR>
nnoremap <silent> <C-k> :tabn<CR>
nnoremap <silent> <leader>c :b#<bar>bd#<bar>b<CR>
nnoremap <silent> <leader>C :bd<CR>
nnoremap <silent> <leader>s :buffers<CR>:buffer<Space>
"nnoremap <s-j> 10j
"nnoremap <s-k> 10k

nmap <silent> <leader>m :set invnumber<CR>
nmap <silent> <leader>M :set rnu!<CR>

" enables dragging for the split lines
set ttymouse=xterm2
" dragging clicked mouse create a persistent selection
set mouse=a
" ctrl-shift-c to copy selection to X11 copy buffer
vnoremap <silent> <c-s-c> "yy <Bar> :call system('xclip -sel clip', @y)<CR>

set splitbelow
set splitright
set noea " After closing splits don't resize the rest
nmap <silent> <c-w>\| :vs<CR>
nmap <silent> <c-w>- :sp<CR>

set pastetoggle=<leader>p

nnoremap <silent> <c-w><up> :CmdResizeUp<CR>
nnoremap <silent> <c-w><down> :CmdResizeDown<CR>
nnoremap <silent> <c-w><right> :CmdResizeRight<CR>
nnoremap <silent> <c-w><left> :CmdResizeLeft<CR>
nnoremap <silent> <leader><BS> :noh<CR>
