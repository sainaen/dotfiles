" no compatibility with legacy vi
set nocompatible

" enable syntax highlighting
syntax enable

" allow to switch from not saved buffers
set hidden

" allow to use mouse (see :h mouse)
set mouse=a

" allow wrapping but break properly
set wrap linebreak

" a tab is 4 spaces
set tabstop=4 shiftwidth=4 softtabstop=4

" use special chars for tab and EOL
set listchars=tab:›\ ,eol:¬

" highlight matches and show them as I type
set hlsearch incsearch showmatch

" searches are case insensitive unless they contain at leas one capital letter
set ignorecase smartcase

" use relative numbers
set relativenumber

" custom keymap
nmap <leader>l :set list!<CR>							" use \l to toggle whitespace displaying
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>		" use \$ to strip trailing spaces

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
