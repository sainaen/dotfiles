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
" start scrolling three lines before the horizontal window border
set scrolloff=3
" centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" custom keymap
nmap <leader>l :set list!<CR>							" use \l to toggle whitespace displaying
nmap <leader>p :set paste!<CR>							" swap with \p between paste mode or not
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>		" use \$ to strip trailing spaces
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" required for Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" load file type plugins + indentation
filetype plugin indent on

" function to preserve state when invoking commands that otherwise will change it
function! Preserve(command)
	" Save last search and cursor position
	let _s = @/
	let l = line(".")
	let c = col(".")
	" Do the business
	execute a:command
	" Restore
	let @/ = _s
	call cursor(l, c)
endfunction
