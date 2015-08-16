if match($TERM, "screen")!=-1
    set term=xterm
endif

set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
syntax on

set pastetoggle=<C-Down>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Up> :tabnew<CR>:E<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
