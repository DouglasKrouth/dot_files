require('krouth.remap')
require('krouth.packer')
require('Comment').setup()
require("nvim-surround").setup()

vim.o.background = "light"
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[map <space>e :lua vim.diagnostic.open_float(0, {scope="line"})<CR>]])
vim.cmd([[
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set cursorline
set showmatch
set ruler
syntax enable
imap jj <Esc>
imap jk <Esc>
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" |     set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  |     set nornu | endif
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
augroup END
]])
	  --setpath+=**
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
