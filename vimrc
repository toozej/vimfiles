"Use Vim settings, rather then Vi settings (much better!).
set nocompatible

"Plug-ins
"load ftplugins and indent files
filetype plugin on
filetype indent on

"setup plug-installed plug-ins
call plug#begin('~/.vim/plugged')

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Fugitive
Plug 'tpope/vim-fugitive'

" Make Fugitive use Github
Plug 'tpope/vim-rhubarb'

" Vim Polyglot - language support
Plug 'sheerun/vim-polyglot'

" Terraform
Plug 'hashivim/vim-terraform'

" Salt
Plug 'saltstack/salt-vim'

" Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'

" The NERD tree
Plug 'scrooloose/nerdtree'

" NERD tree Git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Atom One Dark colourscheme
Plug 'joshdick/onedark.vim'

"backup vim color schemes from old vimfiles
"Plug 'flazz/vim-colorschemes'

" distraction-free writing
Plug 'junegunn/goyo.vim'

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim-indent-guides
Plug 'nathanaelkane/vim-indent-guides'

" Ctrl-P Atom-like fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" Asynchronous task dispatcher
Plug 'tpope/vim-dispatch'

call plug#end()


" Display and UI Settings
set background=dark
set t_Co=256
"use Atom's OneDark colourscheme
let g:onedark_termcolors = 256
let g:AirlineTheme='onedark'
"use the ron colorscheme if onedark is unavailable
silent! colorscheme ron
silent! colorscheme onedark

"show incomplete cmds down the bottom
set showcmd
"show current mode down the bottom
set showmode
"show line numbers
set number
" Highlight current line and column
set cursorline
"show ruler
set ruler
"use visual bell instead of beep
set visualbell

"indent guides using vim-indent-guides plugin
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"store lots of :cmdline history
set history=1000
"display trailing spaces
set list
set listchars=tab:\ \ ,trail:⋅,nbsp:⋅
"don't wrap lines
set wrap
set linebreak
set nolist
"mark the ideal max text width
set colorcolumn=+1
"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
"turn on syntax highlighting
syntax on
"hide buffers when not displayed
set hidden



" Font Settings
set guifont=Ubuntu\ Mono\ 12



" Formatting Settings
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
set textwidth=0
"default indent settings
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent



" Search and Find Settings
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default



" Undo Settings
if has("win32")
	set undodir=~/vimfiles/undofiles
else
	set undodir=~/.vim/undofiles
endif



" Language-Specific Settings
"enable fmt automatically when saving terraform or Go files
" terraform from: https://github.com/hashivim/vim-terraform
let g:terraform_fmt_on_save=1
" Go from: https://github.com/fatih/vim-go
let g:go_fmt_autosave=1



" System + OS Settings
"mouse work in terminal
set mouse=a
set ttymouse=xterm2
"setup clipboard for Mac OS
set clipboard=unnamed
"disable swapfile
set noswapfile
"make cmdline tab completion similar to bash
set wildmode=list:longest
"enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu
"ignore the following when tab completing
set wildignore=*.o,*.obj,*~


" Key Mappings
" General - Built-ins
"yank to end of line (not including \n)
nnoremap Y y$
"auto-reindent
nnoremap <F10> :%retab<CR>
"scroll sync toggle
nnoremap <F11> scb!
"paste mode
set pastetoggle=<F12>
"forcefully write using sudo tee
cmap w!! w !sudo tee >/dev/null %

" Plug-ins
"ctrlp mapping to ctrl-t like Atom
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
"toggle NerdTree
nnoremap <F9> :NERDTreeToggle<CR>



" Plug-in Settings
"NERDTree
" Start NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Force NERDTree to show hidden files
let NERDTreeShowHidden=1
" NERDTree ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']
" NERDTree Minimal UI
let NERDTreeMinimalUI=1
" disable auto-collapsing dirs that have only one child
let NERDTreeCascadeSingleChildDir=0

" ctrlp
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']



" Functions and AutoCMDs
"jump to last cursor position when opening a file
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
	if &filetype !~ 'svn\|commit\c'
		if line("'\"") > 0 && line("'\"") <= line("$")
			exe "normal! g`\""
			normal! zz
		endif
	end
endfunction

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

"adjust tabbing for puppet yaml files
autocmd FileType puppet,yaml setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

"Vagrant syntax highlighting as ruby
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" compile LaTeX as PDF on save
augroup latex
    autocmd!
    autocmd BufEnter *.tex let b:dispatch='pdflatex %'
    autocmd BufWrite *.tex Dispatch!
augroup end


"tmp

set formatoptions-=o "dont continue comments when pushing o/O
