" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"if filereadable("/etc/vim/word_complete.vim")
"  source /etc/vim/word_complete.vim
"  :autocmd BufEnter * call DoWordComplete()
"endif

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

if &t_Co > 2 || has("gui_running")
syntax on
"colorscheme pablo

set hlsearch
set incsearch

set nocp
"set syn=cpp
endif

"set backupext=.bak
"set patchmode=.orig

"set mouse=nv
"set number

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
"set cindent

set iskeyword+=95

set showcmd
set whichwrap=<,>,[,]

filetype plugin indent on

set wildmode=longest,list,full
set wildmenu

set vb t_vb="..."
set nu
set cursorline
set wrap
set textwidth=800
set backupext=.bak

":map <F11> a#include <vector><CR>#include <cstdio><CR>#include <set><CR>#include <map><CR>#include <ctime><CR>#include <string><CR>#include <sstream><CR>#include <cstdlib><CR>#include <iostream><CR>#include <cmath><CR>#include <cstring><CR>#include <cctype><CR><CR>#define inputfilename "input"<CR>#define outputfilename "a.out"<CR><CR>using namespace std;<CR><CR>int main ()<CR>{<CR>/*freopen(inputfilename , "r" , stdin);*/<CR>/*freopen(outputfilename , "w" , stdout);*/<CR><CR><CR><CR>return 0;<CR>}<CR><CR> <ESC>

set backspace=2

"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"colo zellner
set guifont=DejaVuSansMono\ 10

"For tagline
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Menu = 1
map <silent> <F9> :TlistToggle<cr>

"For NERD_commenter.vim
let mapleader=","
map <c-s> ,c<space>
map <c-h> ,cm

"For django
map <F10> <ESC>:setfiletype htmldjango<CR>

"template
"map <silent> <F11> :-1r ~/.vim/template/tem.%:e<cr>

"different tab for web page
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.tex set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2

map <silent> <F11> :Lazyfill<cr>

