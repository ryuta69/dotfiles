"" ----------------------------------------
""	Plugin
"" ----------------------------------------
call plug#begin('~/.config/nvim/plugged/')
	Plug 'tpope/vim-repeat'
	Plug 'ayu-theme/ayu-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'bfredl/nvim-miniyank'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/vim-easy-align'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'yuttie/comfortable-motion.vim'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

"" ----------------------------------------
""	Configure
"" ----------------------------------------
set nobomb
set hidden
set nobackup
set smartcase
set ignorecase
set lazyredraw
set noswapfile
set splitright
set splitbelow
set termguicolors
set tabstop=8
set scrolloff=20
set shiftwidth=8
set encoding=utf-8
set inccommand=split
let $LANG='en_US.UTF-8'
let mapleader="\<Space>"
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set whichwrap=b,s,h,l,<,>,[,]
set fileencodings=cp932,sjis,euc-jp,utf-8,iso-2022-jp
au  BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"" ----------------------------------------
""	Mapping
"" ----------------------------------------
nn  Y y$
nn  + <C-a>
nn  - <C-x>
nn  <Up> gk
nn  <Down> gj
nn  <Leader>t :tabnew<CR>
nn  <Leader>1 :diffget LOCAL<CR>
nn  <Leader>2 :diffget BASE<CR>
nn  <Leader>3 :diffget REMOTE<CR>
nn  <Leader>code :!code %:p<CR>
nn  <Leader>wkdir :!code -r %:p:h<CR>
nn  <Leader>sh :split \| terminal<CR>
map <Leader>\ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"" ----------------------------------------
""	PluginSetting
"" ----------------------------------------
"" ========== AyuVim ==========
colo ayu
let  ayucolor="dark"
hi   DiffAdd    gui=none guifg=none    guibg=#003366
hi   DiffDelete gui=bold guifg=#660000 guibg=#660000
hi   DiffChange gui=none guifg=none    guibg=#006666
hi   DiffText   gui=none guifg=none    guibg=#013220

"" ========== FzfVim ==========
nn   <Leader>file :Files<CR>
nn   <Leader>hist :History<CR>
nn   <Leader>rg   :call Rg()<CR>
let  g:fzf_layout = { 'right': '~50%' }
com! -bang -nargs=* History call fzf#vim#history(fzf#vim#with_preview('down:50%'))
com! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:50%'), <bang>0)
fun! Rg()
	let string = input('Search String: ')
	call fzf#run(fzf#wrap({
		\ 'source': 'rg -lin ' . string,
		\ 'options': '--preview-window bottom:50% --preview "rg -in --color=always ' . string . ' {}"'}))
endfun

"" ========== VimPlug ==========
nn <Leader>clean   :PlugClean<CR>
nn <Leader>update  :PlugUpdate<CR>
nn <Leader>install :PlugInstall<CR>

"" ========== Deoplete ==========
let g:deoplete#enable_at_startup = 1
ino <expr> <up>    pumvisible() ? '<c-e><up>'   : '<up>'
ino <expr> <down>  pumvisible() ? '<c-e><down>' : '<down>'
ino <expr> <Tab>   pumvisible() ? "\<C-n>"      : "\<Tab>"
ino <expr> <S-Tab> pumvisible() ? "\<C-p>"      : "\<S-Tab>"

"" ========== Ultisnips ==========
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"" ========== EasyAlign ==========
xm ga <Plug>(LiveEasyAlign)
nm ga <Plug>(LiveEasyAlign)

"" ========== EasyMotion ==========
let g:EasyMotion_do_mapping=0
let g:EasyMotion_enter_jump_first=1
map <Leader>s <Plug>(easymotion-sn)

"" ========== VimFugitive ==========
nn  <Leader>gd  :Gdiff<CR>
nn  <Leader>ga  :Gwrite<CR>
nn  <Leader>gb  :Gblame<CR>
nn  <Leader>gs  :Gstatus<CR>
nn  <Leader>dp  :diffput<CR>
nn  <Leader>du  :diffupdate<CR>
nn  <Leader>dgl :diffget //2 \| diffupdate<CR>
nn  <Leader>dgr :diffget //3 \| diffupdate<CR>
set diffopt+=vertical

"" ========== NvimMiniyank ==========
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

"" ========== VimTrailingSpace ==========
nn <Leader>trim :FixWhitespace<CR>
