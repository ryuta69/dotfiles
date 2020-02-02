"" ----------------------------------------
""	Plugin
"" ----------------------------------------
call plug#begin('~/.config/nvim/plugged/')
	" Plug 'w0rp/ale'
	Plug 'ayu-theme/ayu-vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'bfredl/nvim-miniyank'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
set fileencoding=utf-8
set fileencodings=utf-8,sjis,cp932,euc-jp
let $LANG='en_US.UTF-8'
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set guicursor=a:ver25-blinkon10
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif

"" ----------------------------------------
""	LeaderShortcut
"" ----------------------------------------
nmap <C-e> $
nmap <C-a> 0
nmap <C-f> W
nmap <C-b> B
nnoremap Y y$
nnoremap kk 15k
nnoremap jj 15j
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <Up> gk
nnoremap <Down> gj
nmap <silent> <Tab> 15<Right>
nmap <silent> <S-Tab> 15<Left>
let mapleader="\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>ee :e<CR>
nnoremap <Leader>qq :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>nn :noh<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>s :<C-u>split<CR>
nnoremap <Leader>v :<C-u>vsplit<CR>

"" ----------------------------------------
"" PluginSetting
"" ----------------------------------------
" VimPlug
nnoremap <Leader>clean :PlugClean<CR>
nnoremap <Leader>install :PlugInstall<CR>

" AyuVim
let ayucolor="dark"
colorscheme ayu

" Deoplete
let g:deoplete#enable_at_startup = 1

" VimTrailingWhitespace
nnoremap <Leader>trim :FixWhitespace<CR>

" NvimMiniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" VimFzf
nnoremap <Leader>file :Files<CR>
nnoremap <Leader>hist :History<CR>
let g:fzf_layout = { 'right': '~50%' }
command! -bang -nargs=* Rg
	\ call fzf#run(fzf#wrap({
		\ 'source': 'rg -lin <q-args>',
		\ 'options': '--preview-window bottom:50% --preview "rg -in <q-args> {}"'}))

" Ale
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_fix_on_save = 0
" let g:ale_fix_on_text_changed = 'never'
" let g:ale_linters = {
" \  'javascript': ['eslint'],
" \  'go': ['gofmt'],
" \  'perl': ['perl -c'],
" \}
" nnoremap <Leader>detail :ALEDetails<CR>
