" no compatibility with legacy vi
set nocompatible
" enable syntax highlighting
syntax enable
" allow to switch from not saved buffers
set hidden
" show currently typed command
set showcmd
" allow to use mouse (see :h mouse)
set mouse=a
" open new split panes to right and bottom
set splitbelow splitright
" allow wrapping but break properly
set wrap linebreak
" a tab is 4 spaces
set tabstop=4 shiftwidth=4 softtabstop=4
" use special chars for tab and EOL
set listchars=tab:›\ ,eol:¬,trail:·
" show whitespaces by default
set list
" highlight matches and show them as I type
set hlsearch incsearch showmatch
" searches are case insensitive unless they contain at leas one capital letter
set ignorecase smartcase
" use relative numbers
" set relativenumber
" but show current line number too
set number
" highlight current line
set cursorline
" start scrolling three lines before the horizontal window border
set scrolloff=3
" show command auto complete
set wildmenu
" and at first invocation try to auto complete till longest common string,
" and then allow to cycle through matches
set wildmode=longest:full,full
" enable status line even when there is only one window
set laststatus=2
" centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists('&undodir')
	set undodir=~/.vim/undo
endif

" set default spell checking language
setlocal spelllang=en_us

" automatically enable spell checking
if has('autocmd')
	" for markdown files
	autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
	" and for git's commit message buffers
	autocmd FileType gitcommit setlocal spell
endif

" GUI
if has('gui_gtk2')
	set guifont=Meslo\ LG\ M\ 13,Droid\ Sans\ Mono\ 13,Monospace\ 13
endif

" remap leader key
let mapleader = "\<Space>"
" custom keymap
" use ,w to toggle whitespace displaying
nmap <leader>w :set list!<CR>
" use <leader>, p|d|y to work with X Server buffer
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
" use <leader>,t to strip trailing spaces
nmap <leader>t :call Preserve("%s/\\s\\+$//e")<CR>
" stop search results highlighting with <leader>,h
nnoremap <leader>h :nohlsearch<CR>
" quit from insert mode with `jj`
inoremap jj <ESC>
" reselect visual block after indent/outdent and reindenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
" don't use arrow keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" required for Vundle
filetype off
set shell=/bin/sh

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Plugin 'gmarik/vundle'

" language pack
Plugin 'sheerun/vim-polyglot'

" make vim recognize .gradle files as groovy
Plugin 'tfnico/vim-gradle'

" fuzzy file search in current dir
Plugin 'kien/ctrlp.vim'

" commenting
Plugin 'tomtom/tcomment_vim'

" allows to surround with quotes, tags, etc.
Plugin 'tpope/vim-surround'

" tries to balance opening and closing quotes, brackets, etc.
" (similar to Emacs' paredit plugin)
Plugin 'paredit.vim'

" allows to traverse Vim's undo tree
Plugin 'sjl/gundo.vim'

" file system browser
Plugin 'scrooloose/nerdtree'

" Clojure REPL intregration
Plugin 'tpope/vim-fireplace'

" enable 256 colors in the terminal
Plugin 'godlygeek/csapprox'

" Base16 color theme
Plugin 'chriskempson/base16-vim'

" load file type plugins + indentation
filetype plugin indent on

" use base16 default theme (dark variant)
set background=dark
colorscheme base16-default

" make CtrlP to scan for dotfiles and dotdirs
let g:ctrlp_show_hidden = 1

" add a shortcut for Gundo
nnoremap <leader>u :GundoToggle<CR>

" show/hide NerdTree window on ,f
nnoremap <leader>f :NERDTreeToggle<CR>

" function to preserve state when invoking commands that otherwise will change it
function! Preserve(command)
	" Save last search and cursor position
	let _s = @/
	let l = line('.')
	let c = col('.')
	" Do the business
	execute a:command
	" Restore
	let @/ = _s
	call cursor(l, c)
endfunction
