"" ----------------------------------------
""	Plugin
"" ----------------------------------------
call plug#begin('~/.config/nvim/plugged/')
	Plug 'ayu-theme/ayu-vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'bfredl/nvim-miniyank'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/async.vim'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'prabirshrestha/asyncomplete-file.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
call plug#end()

"" ----------------------------------------
""	Configure
"" ----------------------------------------
set hidden
set autoread
set lazyredraw
set nobomb
set nobackup
set noswapfile
set hlsearch
set incsearch
set smartcase
set ignorecase
set splitright
set splitbelow
set termguicolors
set mouse=a
set tabstop=8
set shiftwidth=8
set scrolloff=10
set encoding=utf-8
set fileencodings=cp932,sjis,euc-jp,utf-8,iso-2022-jp
let $LANG='en_US.UTF-8'
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set guicursor=a:ver25-blinkon10
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif

"" ----------------------------------------
""	Shortcut
"" ----------------------------------------
nnoremap Y y$
nnoremap <C-e> $
nnoremap <C-a> 0
nnoremap <C-f> W
nnoremap <C-b> B
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <silent> <Tab> 15<Right>
nnoremap <silent> <S-Tab> 15<Left>
let mapleader="\<Space>"
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>code :!code %:p<CR>
if &diff
	nnoremap <leader>1 :diffget LOCAL<CR>
	nnoremap <leader>2 :diffget BASE<CR>
	nnoremap <leader>3 :diffget REMOTE<CR>
endif

"" ----------------------------------------
""	PluginSetting
"" ----------------------------------------
" AyuVim
colorscheme ayu
let ayucolor="dark"
if &diff
	highlight DiffAdd    gui=none guifg=none    guibg=#003366
	highlight DiffDelete gui=bold guifg=#660000 guibg=#660000
	highlight DiffChange gui=none guifg=none    guibg=#006666
	highlight DiffText   gui=none guifg=none    guibg=#013220
endif

" VimFzf
nnoremap <Leader>file :Files<CR>
nnoremap <Leader>hist :History<CR>
let g:fzf_layout = { 'right': '~50%' }
function! Rg()
	let string = input('Search String: ')
	call fzf#run(fzf#wrap({
		\ 'source': 'rg -lin ' . string,
		\ 'options': '--preview-window bottom:50% --preview "rg -in ' . string . ' {}"'}))
endfunction
nnoremap <Leader>rg :call Rg()<CR>

" VimLsp
nnoremap <Leader>lspup :LspInstallServer<CR>
nnoremap <Leader>format :LspDocumentFormat<CR>

" VimPlug
nnoremap <Leader>clean :PlugClean<CR>
nnoremap <Leader>install :PlugInstall<CR>

" NvimMiniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" AsynCompleteFile
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
	\ 'name': 'file',
	\ 'whitelist': ['*'],
	\ 'priority': 10,
	\ 'completor': function('asyncomplete#sources#file#completor')
	\ }))

" VimTrailingWhitespace
nnoremap <Leader>trim :FixWhitespace<CR>
