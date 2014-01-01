set nocompatible							" no compatibility with legacy vi
syntax enable

set encoding=utf-8
set showcmd									" display incomplete commands
set hidden									" make working with hidden buffers easier
set mouse=a									" allow to use mouse (see :h mouse)

set linebreak								" break properly

"" Whitespace
set tabstop=4 shiftwidth=4 softtabstop=4 	" a tab is 4 spaces
set listchars=tab:›\ ,eol:¬					" use special chars for tab and EOL

"" Searching
set hlsearch								" highlight matches
set incsearch								" incremental searching
set ignorecase								" searches are case insensitive
set smartcase								" ... unless they contain at leas one capital letter
set relativenumber							" use relative numbers

"" Keymaps
nmap <leader>l :set list!<CR>				" use \l to toggle whitespace displaying
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>	" use \$ to strip trailing spaces

"" Util functions
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

filetype off								" required for Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

filetype plugin indent on					" load file type plugins + indentation
