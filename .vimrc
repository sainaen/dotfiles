set nocompatible							" no compatibility with legacy vi
syntax enable

set encoding=utf-8
set showcmd									" display incomplete commands
filetype plugin indent on					" load file type plugins + indentation

"" Whitespace
set nowrap									" don't wrap lines
set tabstop=4 shiftwidth=4 softtabstop=4 	" a tab is 4 spaces
set listchars=tab:›\ ,eol:¬					" use special chars for tab and EOL
set list									" enable displaying of whitespaces by default

"" Searching
set hlsearch								" highlight matches
set incsearch								" incremental searching
set ignorecase								" searches are case insensitive
set smartcase								" ... unless they contain at leas one capital letter
set relativenumber							" use relative numbers

"" Keymaps
nmap <leader>l :set list!<CR>				" use \l to toggle whitespace displaying

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
