" .vimrc File
" Maintained by: Fabrício Tavares
" @fabriciotav

set modifiable

"Sem compatibilidade com Vi
set nocompatible

set number

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files
set autowrite

"Display current cursor position in lower right corner
set ruler

"Lower the timeout
set timeoutlen=500

"Show hidden files in NERDTree
let NERDTreeShowHidden=1

"cd ~/Dropbox/htdocs/fabriciotav/_posts

"turn off needless toolbar on gvim/mvim
set guioptions-=T

colorscheme railscasts
if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    colorscheme railscasts
    set guitablabel=%M%t
    set lines=58
    set columns=115

    if has("gui_gnome")
        set term=gnome-256color
        colorscheme desert
        set guifont=Inconsolata\ Medium\ 12
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h13
        " key binding for Command-T to behave properly
        " uncomment to replace the Mac Command-T key to Command-T plugin
        "macmenu &File.New\ Tab key=<nop>
        "map <D-t> :CommandT<CR>
        " make Mac's Option key behave as the Meta key
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set railscasts colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme railscasts
    else
        if $TERM == 'xterm'
            set term=xterm-256color
            colorscheme railscasts
        else
            colorscheme default
        endif
    endif
endif

"Show relative linenumber
"set relativenumber
"Or line number
"set number

set encoding=utf-8
"For Zen Coding
let g:user_zen_expandabbr_key = '<c-e>' 
let g:use_zen_complete_tag = 1

"Arruma o tab pro jeito que eu gosto! =D
set ts=4  "Changing tabs to spaces
set shiftwidth=4
set expandtab

"Map NERDTree to \p
nmap <silent> <Leader>p :execute "NERDTreeToggle" getcwd()<CR>

nmap <C-d> a<C-R>=strftime("%d-%m-%Y %H:%M")<Esc>
imap <C-d> <C-R>=strftime("%d-%m-%Y %H:%M")<CR>

"Indent stuff
set smartindent
set autoindent

"Higher line height
set linespace=3

"Map escape key to jj -- much faster
imap jj <esc>

"Show matching brackets
set showmatch

"Toggle comment (using tComment plugin)
map <leader>c <c-_><c-_>

"Closing parenteses and braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap ((     (
inoremap ()     ()
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

au BufNewFile,BufRead *.less set filetype=less
