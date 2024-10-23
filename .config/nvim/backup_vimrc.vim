filetype plugin indent on
syntax on
:set expandtab
:set shiftwidth=4
:set tabstop=4
:set autoindent
:set cursorline
:set showmatch
:set ruler
:syntax enable
imap jj <Esc>
imap jk <Esc>
"" FINDING FILES
"" Search into subfolders
"" Provides tab-comletion for all file-related tasks
"" ** = when you look for a file, search all sub-directories
set path+=**
"" Display all matching files from search
"set wildmenu
"FILE BROWSING
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 0
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
" Add functionality to enable relative ln in --normal-- and absolute ln in
" --insert--
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" |     set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  |     set nornu | endif
:augroup END
