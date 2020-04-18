"" ----------------------------------------
""	Plugin
"" ----------------------------------------
let plugdir=has('nvim') ? '~/.config/nvim/plugged/' : '~/.vim/plugged'
call plug#begin(plugdir)
	Plug 'ayu-theme/ayu-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/vim-easy-align'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'yuttie/comfortable-motion.vim'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
	Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ'
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'mattn/emmet-vim'
	Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	if has('nvim')
		Plug 'bfredl/nvim-miniyank'
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'roxma/nvim-yarp'
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
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
set wildignorecase
set scrolloff=20
set laststatus=0
set encoding=utf-8
let $LANG='en_US.UTF-8'
let mapleader="\<Space>"
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set whichwrap=b,s,h,l,<,>,[,]
set fileencodings=cp932,sjis,euc-jp,utf-8,iso-2022-jp
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
if has('nvim')
	set inccommand=split
else
	syntax on
	set showcmd
	set autoread
	set hlsearch
	set wildmenu
	set incsearch
	set belloff=all
	filetype plugin indent on
	set backspace=indent,eol,start
endif

"" ----------------------------------------
""	Mapping
"" ----------------------------------------
nn Y y$
nn + <C-a>
nn - <C-x>
nn <Up> gk
nn <Down> gj
nn <Leader>t :tabnew<CR>
nn <Leader>1 :diffget LOCAL<CR>
nn <Leader>2 :diffget BASE<CR>
nn <Leader>3 :diffget REMOTE<CR>
nn <Leader>code  :!code %:p<CR>
nn <Leader>wkdir :!code -r %:p:h<CR>
nn <Leader>term  :split \| terminal<CR>
map <Leader>\ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"" ----------------------------------------
""	PluginSetting
"" ----------------------------------------
"" ========== AyuVim ==========
colo ayu
let ayucolor='dark'
hi DiffAdd    gui=NONE guifg=NONE    guibg=#003366
hi DiffDelete gui=bold guifg=#660000 guibg=#660000
hi DiffChange gui=NONE guifg=NONE    guibg=#006666
hi DiffText   gui=NONE guifg=NONE    guibg=#013220

"" ========== FzfVim ==========
nn <Leader>file :Files<CR>
nn <Leader>hist :History<CR>
nn <Leader>rg   :call Rg()<CR>
let g:fzf_layout={ 'right': '~45%' }
com! -bang -nargs=* History call fzf#vim#history(fzf#vim#with_preview('down:50%'))
com! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:50%'), <bang>0)
fun! Rg()
	let string=input('Search String: ')
	call fzf#run(fzf#wrap({
		\ 'source': 'rg -lin ' . string,
		\ 'options': '--preview-window bottom:60% --preview "rg -in --color=always ' . string . ' {}"'
	\ }))
endfun

"" ========== VimPlug ==========
nn <Leader>clean   :PlugClean<CR>
nn <Leader>update  :PlugUpdate<CR>
nn <Leader>install :PlugInstall<CR>

"" ========== EmmetVim ==========
let g:user_emmet_settings = {
	\ 'typescript'     : { 'extends' : 'jsx' },
	\ 'javascript.jsx' : { 'extends' : 'jsx' }
\ }

"" ========== VsnipVim ==========
nn <Leader>vop :VsnipOpen<CR>
imap <expr> <c-f> vsnip#available(1)  ? '<Plug>(vsnip-jump-next)' : '<c-f>'
smap <expr> <c-f> vsnip#available(1)  ? '<Plug>(vsnip-jump-next)' : '<c-f>'
imap <expr> <c-b> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)' : '<c-b>'
smap <expr> <c-b> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)' : '<c-b>'

"" ========== Deoplete ==========
let g:deoplete#enable_at_startup = 1
ino <expr> <up>    pumvisible() ? '<c-e><up>'   : '<up>'
ino <expr> <down>  pumvisible() ? '<c-e><down>' : '<down>'
ino <expr> <Tab>   pumvisible() ? "\<C-n>"      : "\<Tab>"
ino <expr> <S-Tab> pumvisible() ? "\<C-p>"      : "\<S-Tab>"

"" ========== Ultisnips ==========
let g:ulti_expand_or_jump_res = 0
let g:UltiSnipsExpandTrigger='<NUL>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
fun! DeoEnter()
	if pumvisible()
		if vsnip#available(1)
			call vsnip#expand()
			return "\<c-y>"
		endif

		call UltiSnips#ExpandSnippetOrJump()
		if g:ulti_expand_or_jump_res > 0
			return ""
		endif

		return "\<c-y> "
	endif

	return "\n"
endfun
ino <CR> <C-R>=DeoEnter()<CR>

"" ========== EasyAlign ==========
xm ga <Plug>(LiveEasyAlign)
nm ga <Plug>(LiveEasyAlign)

"" ========== EasyMotion ==========
let g:EasyMotion_do_mapping=0
let g:EasyMotion_enter_jump_first=1
map <Leader>s <Plug>(easymotion-sn)

"" ========== VimFugitive ==========
nn <Leader>gd  :Gdiff<CR>
nn <Leader>ga  :Gwrite<CR>
nn <Leader>gb  :Gblame<CR>
nn <Leader>gs  :Gstatus<CR>
nn <Leader>dp  :diffput<CR>
nn <Leader>du  :diffupdate<CR>
nn <Leader>dgl :diffget //2 \| diffupdate<CR>
nn <Leader>dgr :diffget //3 \| diffupdate<CR>
set diffopt+=vertical

"" ========== NvimMiniyank ==========
if has("nvim")
	map p <Plug>(miniyank-autoput)
	map P <Plug>(miniyank-autoPut)
endif

"" ========== VimTrailingSpace ==========
nn <Leader>trim :FixWhitespace<CR>
