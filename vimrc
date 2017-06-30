" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"+++function start+++
function! RelativeNumber()
  set relativenumber
endfunc
function! IndentationLines()
  set listchars=tab:\⋮\ 
  set list
endfunc
function! FileTree()
  let g:netrw_banner = 0
  let g:netrw_liststyle = 3
  let g:netrw_winsize = 32
  let g:netrw_browse_split = 4
  let g:netrw_altv = 1
  augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vexplore
  augroup END
endfunc
"+++function end+++



"+++mapping start+++
nnoremap <F9> :w <CR> :!g++ % -o %< && ./%< <CR>
nnoremap <F10> :vs . <CR> :vertical resize 32 <CR>
nnoremap tree :call FileTree() <CR>
nnoremap <C-m> :call RelativeNumber()<CR>
nnoremap ind :call IndentationLines()<CR>
nnoremap <silent> <S-j> :resize -1<CR>
nnoremap <silent> <S-k> :resize +1<CR>
nnoremap <silent> <S-h> :vertical resize -1<CR>
nnoremap <silent> <S-l> :vertical resize +1<CR>
nnoremap hmin :vertical resize 0<CR>
nnoremap hmm :vertical resize 110<CR>
nnoremap hmax :vertical resize 220<CR>
nnoremap fmin :resize 0<CR>
nnoremap fmm:resize 34<CR>
nnoremap fmax :resize 68<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap ext :wq <CR> 
nnoremap ff :w <CR>
:inoremap jj <Esc>
"+++mapping end+++


"+++automate start+++
autocmd FileType html inoremap ;ht <!DOCTYPE html><CR><html><CR><Tab><head><CR><Tab><meta charset='UTF-8'><CR><C-d></head><CR><body><CR></body><CR><C-d></html><Space><Esc>i
autocmd FileType html inoremap ;he <header class='</header><Space><Esc>T'i
autocmd FileType html inoremap ;na <nav class='</nav><Space><Esc>T'i
autocmd FileType html inoremap ;ar <article class='</article><Space><Esc>T'i
autocmd FileType html inoremap ;as <aside class='</aside><Space><Esc>T'i
autocmd FileType html inoremap ;se <section class='</section><Space><Esc>T'i
autocmd FileType html inoremap ;fo <footer class='</footer><Space><Esc>T'i
autocmd FileType html inoremap ;di <div class='</div><Space><Esc>T'i
autocmd FileType html inoremap ;li <link rel='stylesheet' type='text/css' href='><Space><Esc>T'i
autocmd FileType html inoremap ;sc <script type='text/javascript' src='><Space><Esc>T'i
autocmd FileType html inoremap ;ls <li><a href='</a></li><Space><Esc>T'i
autocmd FileType html inoremap ;ul <ul class='><CR><CR></ul><Space><Esc>T'i

autocmd FileType css inoremap ! !important;<CR>
autocmd FileType css inoremap ;com /**/<Esc>F*i
autocmd FileType css inoremap ;disp display: none !important;<CR>
"+++automate end+++

"+++vim configurations start+++
syntax on
"set digraph
set t_Co=256
set showcmd
set incsearch
set ignorecase
set hlsearch
set showmatch
set modifiable
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set nohidden
set nocompatible
set number
filetype plugin on
set listchars=tab:\⋮\ 
set list

"++vim configurations end+++
