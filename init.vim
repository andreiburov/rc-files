let mapleader=","
let g:plugged_home = '~/.vim/plugged'

filetype on " Must be turned on for some pluggins

" PlugInstall/PlugClean
" Plugins List
call plug#begin(g:plugged_home)
  Plug 'davidhalter/jedi-vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'idanarye/vim-vebugger'
" Plug 'vim-vdebug/vdebug'
"  Plug 'ervandew/supertab'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
"  Plug 'ap/vim-buftabline'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'majutsushi/tagbar'
  Plug 'breuckelen/vim-resize'
  Plug 'w0rp/ale'
  Plug 'Valloric/ListToggle'
"  Plug 'SkyLeach/pudb.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" filetype plugin indent on

" Configurations Part
" UI configuration

syntax enable

set mouse=a

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set expandtab
    \set autoindent
    \set fileformat=unix

nnoremap <silent> <leader>n :NERDTreeToggle<Enter>

let g:vebugger_leader='<silent> <leader>d'

" let g:SuperTabMappingBackward = "<silent> <tab>"
" let g:SuperTabMappingForward = "<silent> <s-tab>"
" let g:SuperTabMappingTabLiteral = "<silent> <leader><tab>"

let g:jedi#show_call_signatures = 2
" let g:jedi#goto_command = "<silent> <leader>d"
let g:jedi#goto_assignments_command = "<silent> <leader>g"
let g:jedi#goto_definitions_command = "<silent> <leader>b"
let g:jedi#documentation_command = "<silent> <leader>?"
let g:jedi#usages_command = "<silent> <leader>u"
let g:jedi#completions_command = "<silent> <C-Space>"
let g:jedi#rename_command = "<silent> <leader>r"

let g:ale_python_flake8_args = '--ignore=E501,E401'
let g:ale_python_flake8_options = '--ignore=E501,E401'
let g:ale_linters = {'python' : ['flake8']}
let g:ale_linters_explicit = 1 " run only specified linters
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✗'
highlight clear SignColumn
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
highlight clear ALEInfoSign
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_set_highlights = 0 " highlight the line with error
nmap <silent> <leader>x :ALENext<cr>
nmap <silent> <leader>z :ALEPrevious<cr>

tnoremap <Esc> <C-\><C-n> " Esc for the terminal mode, use 'i' to enter back
" nnoremap <silent> <leader>dl :PUDBLaunchDebuggerTab<CR>
" nnoremap <silent> <leader>dt :PUDBToggleBreakPoint<CR>
" nnoremap <silent> <leader>dc :PUDBClearAllBreakpoints<CR>
" nnoremap <silent> <leader>du :PUDBUpdateBreakPoints<CR>
" nnoremap <silent> <leader>ds :PUDBStatus<CR>
" nnoremap <silent> <leader>dv :PUDBSetEntrypointVENV<CR>
" nnoremap <silent> <leader>de :PUDBSetEntrypoint<CR>
"
" vebugger keymaps:
"
" :VBGstartPDB script.py
" :VBGkill
"
" i      |:VBGstepIn|
" o      |:VBGstepOver|
" O      |:VBGstepOut|
" c      |:VBGcontinue|
" 
" b      |:VBGtoggleBreakpointThisLine|
" B      |:VBGclearBreakpints|
" 
" e      |:VBGevalWordUnderCursor| in normal mode
"        |:VBGevalSelectedText| in select mode
" E      Prompt for an argument for |:VBGeval|
" 
" x      |:VBGexecute| current line in normal mode.
"        |:VBGexecuteSelectedText| in select mode
" X      Prompt for an argument for |:VBGexecute|
" 
" t      |:VBGtoggleTerminalBuffer|
" r      Select mode only - |:VBGrawWriteSelectedText|
" R      Prompt for an argument for |:VBGrawWrite|

function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=auto
        let b:signcolumn_on=1
    endif
endfunction

nnoremap <silent> <leader>e :call ToggleSignColumn()<CR>
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

let g:tagbar_autofocus = 1
nnoremap <silent> <leader>t :TagbarToggle<CR>

nmap <silent> <leader>fb :Buffers<CR>
nmap <silent> <leader>ff :Files<CR>
nmap <silent> <leader>ft :Tags<CR>

set hidden
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprev<CR>
nnoremap <silent> <C-j> :tabp<CR>
nnoremap <silent> <C-k> :tabn<CR>
nnoremap <silent> <leader>c :b#<bar>bd#<bar>b<CR>
nnoremap <silent> <leader>C :bd<CR>
nnoremap <silent> <leader>s :buffers<CR>:buffer<Space>

nmap <silent> <leader>m :set invnumber<CR>
nmap <silent> <leader>M :set rnu!<CR>

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
