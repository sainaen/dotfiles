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
" highlight matches and show them as I type
set hlsearch incsearch showmatch
" searches are case insensitive unless they contain at leas one capital letter
set ignorecase smartcase
" use relative numbers
set relativenumber
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

" GUI
if has("gui_gtk2")
	set guifont=Meslo\ LG\ M\ 13,Droid\ Sans\ Mono\ 13,Monospace\ 13
endif

" custom keymap
nmap <leader>l :set list!<CR>							" use \l to toggle whitespace displaying
nmap <leader>p :set paste!<CR>							" swap with \p between paste mode or not
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>		" use \$ to strip trailing spaces
inoremap jj <ESC>										" quit from insert mode with `jj`
" reselect visual block after indent/outdent and reindenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" required for Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" language pack
Bundle 'sheerun/vim-polyglot'

" fuzzy file search in current dir
Bundle 'kien/ctrlp.vim'

" commenting
Bundle 'tomtom/tcomment_vim'

" allows to surround with quotes, tags, etc.
Bundle 'tpope/vim-surround'

" tries to balance opening and closing quotes, brackets, etc.
" (similar to Emacs' paredit plugin)
Bundle 'paredit.vim'

" allows to traverse Vim's undo tree
Bundle 'sjl/gundo.vim'

" file system browser
Bundle 'scrooloose/nerdtree'

" enable 256 colors in the terminal
Bundle 'godlygeek/csapprox'

" Base16 color theme
Bundle 'chriskempson/base16-vim'

" load file type plugins + indentation
filetype plugin indent on

" use base16 default theme (dark variant)
set background=dark
colorscheme base16-default

" make CtrlP to scan for dotfiles and dotdirs
let g:ctrlp_show_hidden = 1

" add a shortcut for Gundo
nnoremap <Leader>u :GundoToggle<CR>

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
